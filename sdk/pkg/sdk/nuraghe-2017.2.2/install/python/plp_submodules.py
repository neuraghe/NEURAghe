#!/usr/bin/env python3

import plp_submodules
import os
import subprocess
import re
import re as regexp
import collections
import configparser
import hashlib
import sys
import tarfile
import ci
import time
import jenkinsapi
from jenkinsapi.jenkins import Jenkins
import pulpdb
import logging
import datetime
import pdb
from jenkinsapi.utils.requester import Requester
import shutil
import imp
import stat
import pulpconfig
import time


genGlobalEnvFileHeaderCsh = False
genGlobalEnvFileHeader = False

def getRootDir():
    return os.path.realpath(os.path.join(os.path.dirname(os.path.realpath(sys.argv[0])), '..'))

def genEnvHeader(distrib, envFile, isCsh):
    if distrib.lower().find('centos') != -1:
        if isCsh:
            
            envFile.write('alias prepend_path \'set arg2="\!:2";  if ($?\!:1 == 0) setenv \!:1 "$arg2";  if ($?\!:1 && $\!:1 !~ {,*:}"$arg2"{:*,}) setenv \!:1 "$arg2":"$\!:1";\'\n')


            envFile.write('\n') 
            envFile.write('if ( $?LD_LIBRARY_PATH ) then\n') 
            envFile.write('setenv LD_LIBRARY_PATH /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64:$LD_LIBRARY_PATH\n') 
            envFile.write('else\n') 
            envFile.write('prepend_path LD_LIBRARY_PATH /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64\n') 
            envFile.write('endif\n') 
            envFile.write('prepend_path PATH /usr/pack/kcachegrind-0.7.4-gh/bin:$PATH\n')
        else:
            envFile.write('add_path() {\n')
            envFile.write('export PATH=${PATH//":$1:"/:}\n')
            envFile.write('export PATH=${PATH/%":$1"/}\n')
            envFile.write('export PATH=${PATH/#"$1:"/}\n')
            envFile.write('export PATH="$1${PATH:+":$PATH"}"\n')
            envFile.write('}\n')
                
            envFile.write('add_ld_path() {\n')
            envFile.write('export LD_LIBRARY_PATH=${LD_LIBRARY_PATH//":$1:"/:}\n')
            envFile.write('export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/%":$1"/}\n')
            envFile.write('export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/#"$1:"/}\n')
            envFile.write(' export LD_LIBRARY_PATH="$1${LD_LIBRARY_PATH:+":$LD_LIBRARY_PATH"}"\n')
            envFile.write('}\n')

            envFile.write('add_ld_path /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64\n') 
            envFile.write('add_path /usr/pack/kcachegrind-0.7.4-gh/bin\n')

class ArtefactCache(object):

    def __init__(self, path, checkUser):
        self.path = path
        self.checkUser = checkUser

    def canInstall(self):
        return (not self.checkUser or os.environ['USER'] == 'jenkins') and os.path.exists(self.path)

    def install(self, name, version, artefactPath):
        pkgRootPath = os.path.join(self.path, name)
        try:
            os.makedirs(pkgRootPath)
        except:
            pass
        pkgPath = os.path.join(pkgRootPath, version)
        # Don't install dev versions as it can't work with parallel jobs
        if version != 'dev':
            if os.path.exists(pkgPath):
                print ('Removing dev artefact at %s' % (pkgPath))
                shutil.rmtree(pkgPath)
            if not os.path.exists(pkgPath):
                print ('Copying artefact %s to %s' % (artefactPath, pkgPath))
                shutil.copytree(artefactPath, pkgPath)

    def getPkg(self, name, version, path):
        # Dev packages are locally installed with 'dev' version to avoid creating tons of packages
        # So don't use them to avoid mixing different packages in jenkins
        if version == 'dev': return False

        pkgPath = os.path.join(self.path, name, version)
        if not os.path.exists(pkgPath): return False
        try:
            try:
                os.makedirs(os.path.dirname(path))
            except:
                pass
            print ('\033[1m' + '%s' % (name) + '\033[0m' + ': Found in cache at %s, creating symlink at %s' % (pkgPath, path))
            os.symlink(pkgPath, path)
            return True
        except:
            raise
            return False
        
os.environ['PULP_PIPELINE_HOME'] = getRootDir()

cachePath = os.environ.get('PULP_ARTEFACT_CACHE')
if cachePath == None: cachePath = '/usr/scratch2/larain/haugoug/artefacts'

artefactCache = ArtefactCache(cachePath, os.environ.get('PULP_ARTEFACT_CACHE')==None)

if os.environ.get('PYTHON_LOG') != None:
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

def execute(cmd):
    return os.system(cmd)

def check_output(*popenargs, **kwargs):
    if sys.hexversion < 0x02070000:
        r"""Run command with arguments and return its output as a byte string.

        Backported from Python 2.7 as it's implemented as pure python on stdlib.

        >>> check_output(['/usr/bin/python', '--version'])
        Python 2.6.2
        """
        process = subprocess.Popen(stdout=subprocess.PIPE, executable='/bin/bash', *popenargs, **kwargs)
        output, unused_err = process.communicate()
        retcode = process.poll()
        if retcode:
            cmd = kwargs.get("args")
            if cmd is None:
                cmd = popenargs[0]
            error = subprocess.CalledProcessError(retcode, cmd)
            error.output = output
            raise error
        return output
    else:
        return subprocess.check_output(*popenargs, **kwargs)

def getGitVersion(path):
    cwd = getRootDir()
    os.chdir(path)
    gitVersion = check_output('git log -n 1 --format=format:%H'.split()).decode('utf-8')
    os.chdir(cwd)
    return gitVersion

def isGitModified(path):
    cwd = getRootDir()
    os.chdir(path)
    isModified = os.system('git diff-index --quiet HEAD --') != 0
    gitVersion = check_output('git log -n 1 --format=format:%H'.split()).decode('utf-8')
    os.chdir(cwd)
    return isModified

class Submodule(object):

    def __init__(self, name, rootDir, log, stdout):
        self.name = name
        self.parameters = None
        self.folders = None
        self.url = None
        self.path = name
        self.steps = {}
        self.testsuite = None
        self.gitVersion = None
        self.mustBuild = False
        self.version = None
        self.packages = []
        self.constraints = []
        self.cmdNbWorkers = None
        self.log = log
        self.stdout = stdout
        self.loadBuilder('default', rootDir)
        self.branch = None

    def dumpMsg(self, pkg, cmd):
        print ()
        print ('\033[1m' + 'MODULE %s:%s command %s' % (pkg.name, self.name, cmd) + '\033[0m')

    def loadBuilder(self, name, rootDir):
        if name == 'default':
            name = os.path.join(rootDir, 'bin/defaultBuilder.py')
        re = imp.load_source('%s.builder' % (self.name), name)
        self.builder = re.Builder(args=None, nbWorkers=8, log=self.log, stdout=self.stdout)

    def isModified(self):
        return isGitModified(self.path)

    def getGitVersion(self):
        if not self.mustBuild or not os.path.exists(self.path):
            return self.version

        if self.gitVersion == None:
            self.gitVersion = getGitVersion(self.path)

        return self.gitVersion

    def execCmd(self, cmdName, cmd, configs):
        if self.builder != None:
            ret = self.builder.execCmd(self.cmdNbWorkers, cmdName, cmd, configs, self.constraints, self.folders, self.parameters)
        else:
            ret = execute(cmd)
        return ret
        
    def getBranch(self):
        if self.branch != None and self.url != None:
            print ('\033[1m' + '%s: switching to branch: %s' % (self.name, self.branch) + '\033[0m')
            cwd = getRootDir()
            os.chdir(self.path)
            if execute("git fetch"): return -1
            if execute("git checkout %s" % (self.branch)): return -1
            if execute("git pull"): return -1
            os.chdir(cwd)
        return 0

class Package(object):

    def __init__(self, name, distrib, topVersion):
        self.description = None
        self.name = name
        self.modules = []
        self.path = 'pkg/%s' % (name)
        self.relPath = self.path
        self.deps = []
        self.execDeps = []
        self.artefact = name
        self.envFile = None
        self.cshEnvFile = None
        self.mustBuild = False
        self.version = None
        self.envs = []
        self.envDefs = {}
        self.distrib = distrib
        self.hasArtefact = True
        self.hasTestsuite = False
        self.active = True
        self.restrictConfigs = None
        self.topVersion = topVersion
        self.linkToDistrib = True
        self.commands = ''
        self.tagVersion = None
        self.envVersionName = None

    def getActiveExecDeps(self):
        deps = []
        for dep in self.execDeps:
            if dep.active: deps.append(dep)
        return deps

    def getActiveDeps(self):
        deps = []
        for dep in self.deps:
            if dep.active: deps.append(dep)
        return deps

    def checkConfigs(self, configs):
        if self.restrictConfigs != None:
            found = False
            for config in configs:
                config = pulpconfig.getConfig(**config)
                for restrictConfig in self.restrictConfigs:
                    if (config.matchConfig(restrictConfig)):
                        found = True
            if not found: 
                self.active = False

    def getRelativePath(self):
        version = self.version
        if self.tagVersion != None: version = self.tagVersion
        return os.path.join(self.relPath, version)

    def getPath(self):
        version = self.version
        if self.tagVersion != None: version = self.tagVersion
        return os.path.join(self.path, version)

    def hasTestSuite(self):
        for moduleName, module in self.modules:
            if module.testsuite != None: return True
        return False

    def setDbDep(self, db, dep, buildId, currentBuildId):
        tag = db.getTagsTable().reg(package=self.name, tag=self.getHash())
        dbTag = db.getTagsTable().reg(package=dep.name, tag=dep.getHash())
        currentBuild = db.getBuildsTable().findOrReg(status='started', id=currentBuildId, package=tag)

        # Get the build of dependency and register it in case it does not exist in the 
        # database
        depBuild = db.getBuildsTable().findOrReg(status='success', artefact_id=buildId, package=dbTag)
        currentBuild.build.append(depBuild)
        db.getBuildsTable().update()
        
    def setDbArtefactId(self, db, currentBuildId, artefactId):
        tag = db.getTagsTable().reg(package=self.name, tag=self.getHash())
        currentBuild = db.getBuildsTable().findOrReg(status='started', id=currentBuildId, package=tag)
        currentBuild.artefact_id = artefactId
        db.getBuildsTable().update()

    def regToDb(self, db, status, prev=None):
        startDate = None
        sourceList = []
        depList = []

        for moduleName, module in self.modules:
            sourceList.append(db.getSourcesTable().reg(module=module.name, version=module.getGitVersion()))

        for dep in self.deps:
            depList.append(db.getTagsTable().reg(package=dep.name, tag=dep.getHash()))

        logging.debug("Logging result to database (pkg: %s, tag: %s, status: %s)" % (self.name,  self.getHash(), status))
        dbTag = db.getTagsTable().reg(package=self.name, tag=self.getHash(), source=sourceList, dep=depList)

        if prev != None:
            prev.status = status
            prev.startDate = prev.date
            prev.date = datetime.datetime.today()
            db.getBuildsTable().update()
            return prev
        else:
            return db.getBuildsTable().reg(status=status, package=dbTag, startDate=startDate)
        
    def getHashStr(self):
        hashStr = ''
        hashStr += '%s-%s' % (self.name, self.version)
        hashStr += '|top-%s' % (self.topVersion)
        for dep in self.deps:
            hashStr += '|dep-%s-%s' % (dep.name, dep.getHash())
        for moduleName, module in self.modules:
            hashStr += '|mod-%s-%s' % (module.name, module.version)
        
        return hashStr

    def getHash(self):
        m = hashlib.sha1()
        m.update(self.getHashStr().encode('utf-8'))
        return m.hexdigest()
        
    def getVersion(self):
        if self.tagVersion != None: return self.tagVersion
        if self.version == 'dev': return self.getHash()
        else: return self.version
        
    def getDevVersion(self):
        if self.version == 'dev': return self.getHash()
        else: return self.version
        
    def genManifest(self, manifest):
        manifest.write('[packages]\n')
        manifest.write('%s=%s\n' % (self.name, self.getVersion()))
        for dep in self.deps:
            manifest.write('%s=%s\n' % (dep.name, dep.getVersion()))

        manifest.write('\n[modules]\n')
        for moduleName, module in self.modules:
            manifest.write('%s = %s\n' % (module.name, module.getGitVersion()))
        
    def setEnv(self):
        self.oldEnviron = dict(os.environ)

        os.environ['ARTEFACT_VERSION'] = self.version
        os.environ['ARTEFACT_NAME'] = self.artefact
        os.environ['PKG_DIR'] = os.path.join(getRootDir(), self.getPath())
        if os.environ.get('MAKEFLAGS') != None:
            os.environ['ROOT_MAKEFLAGS'] = os.environ.get('MAKEFLAGS')
            del os.environ['MAKEFLAGS']
        os.environ['WORKSTATION_PKG'] = os.path.join(os.environ['PKG_DIR'], 'install', 'ws')
        os.environ['TARGET_PKG'] = os.path.join(os.environ['PKG_DIR'], 'install')

    def clearEnv(self):
        os.environ.clear()
        os.environ.update(self.oldEnviron)

    def clean(self, top, configs, ignoreErrors=True, all=False):
        if self.execCmd(top=top, db=top.db, cmd='clean', step=True, ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all) != 0: return -1       
        return 0

    def checkout(self, top, configs, ignoreErrors=False, all=False, buildAll=False):
        if self.execCmd(top=top, db=top.db, cmd='checkout', ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all, buildAll=buildAll) != 0: return -1                  
        if self.execCmd(top=top, db=top.db, cmd='checkout', step=True, ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all, buildAll=buildAll) != 0: return -1       
        return 0

    def build(self, top, configs, ignoreErrors=False, all=False, buildAll=False):
        if self.execCmd(top=top, db=top.db, cmd='header', step=True, ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all, buildAll=buildAll) != 0: return -1
        if self.execCmd(top=top, db=top.db, cmd='build', step=True, ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all, buildAll=buildAll) != 0: return -1     
        return 0 

    def deploy(self, top, configs, ignoreErrors=False, all=False):
        if self.execCmd(top=top, db=top.db, cmd='deploy', ignoreErrors=ignoreErrors, pkgBuildId=top.pkgBuildId, configs=configs, all=all) != 0: return -1             
        return 0

    def update(self, top, configs, version, ignoreErrors=False, all=False):
        self.version = version
        top.writePkgVersionsFile()        
        return 0

    def shouldBuildArtefact(self, top, configs):
        logging.debug('%s: checking if the artefact must be built' % (self.name))
        
        if self.hasArtefact:
            logging.debug('%s: this package has an artefact, checking if it has already been built' % (self.name))
        
            repo = ci.ArtefactRepository(distrib=self.distrib)
            try:
                artefact = repo.getArtefact(group='pulp', artefact=self.artefact, branch='mainstream', version=self.getVersion(), id=None, build='LAST', unpack=False, linkToDistrib=self.linkToDistrib)
                logging.debug('%s: artefact has been found, skipping build' % (self.artefact))
                return False
                
            except:
                logging.debug('%s: artefact has not been found, artefact should be built' % (self.artefact))
                return True

            logging.debug('%s: this package has not artefact, skipping build' % (self.name))
            return False
                 
    def submitOld(self, top, configs, ignoreErrors=False):
        logging.debug('%s: checking if the artefact must be built' % (self.name))
        
        if self.hasArtefact:
            logging.debug('%s: this package has an artefact, checking if it has already been built' % (self.name))
        
            repo = ci.ArtefactRepository(distrib=self.distrib)
            try:
                artefact = repo.getArtefact(group='pulp', artefact=self.artefact, branch='mainstream', version=self.getVersion(), id=None, build='LAST', unpack=False, linkToDistrib=self.linkToDistrib)
                logging.debug('%s: artefact has been found, skipping build' % (self.artefact))
                
            except:
                logging.debug('%s: artefact has not been found, triggering CI build and waiting for its completion' % (self.artefact))
                status = 'success'
                dbBuild = self.regToDb(self.getDb(), status='started')
                if not self.jenkinsExec(self.name, './plpbuild --p %s --stdout deps checkout build deploy' % (self.name), block=True):
                    print ("%s: package build terminated with an error" % (self.name))
                    exit(1)
                self.regToDb(self.db, status=status, prev=dbBuild)
                if status == 'failure': return -1
        else:
            logging.debug('%s: this package has not artefact, skipping build' % (self.name))
                 
    def branch(self, top, configs, ignoreErrors=False, all=False):
        for moduleName, module in self.modules:
            if module.mustBuild or all:
                module.getBranch()
        return 0

    def submit(self, top, configs, ignoreErrors=False, all=False):
        print('%s: submitting build to Jenkins' % (self.name))
        if not top.jenkinsExec('package', 'plpbuild --p %s --stdout deps checkout build deploy' % (self.name), block=True):
            print ("%s: package build terminated with an error" % (self.name))
            exit(1)
        return 0
        

    def getPackages(self, top, deps, alreadyGot=[], force=False):
        for dep in deps:
            if dep.active and not dep.mustBuild and not dep in alreadyGot:
                alreadyGot.append(dep)
                artefact = top.getPkgArtefact(dep, force=force)

    def getDeps(self, top, configs=None, ignoreErrors=False, alreadyGot=[], force=False):
        self.getPackages(top, self.deps, alreadyGot=alreadyGot, force=force)
        for dep in self.deps:
            dep.getExecDeps(top, configs=configs, alreadyGot=alreadyGot, force=force)
        return 0

    def getExecDeps(self, top, configs, ignoreErrors=False, alreadyGot=[], force=False):
        self.getPackages(top, self.execDeps, alreadyGot=alreadyGot)
        for dep in self.deps:
            dep.getExecDeps(top, configs=configs, alreadyGot=alreadyGot, force=force)

    def dumpPkgMsg(self):
        if not self.dumpedPkgName:
            print ()
            print ('\033[1m' + 'PACKAGE %s' % (self.name) + '\033[0m')
            self.dumpedPkgName = True

    def execCmd(self, db, cmd, configs, step=False, ignoreErrors=False, cmdPrefix=None, testsuites=None, pkgBuildId=None, top=None, all=False, buildAll=False):

        self.dumpedPkgName = False

        if cmdPrefix == None:
            if top == None: cmdPrefix = ''
            else: cmdPrefix = top.getCmdPrefix()

        # TODO try to propagate this to the new process executing the command to avoid polluting this process
        self.setEnv()

        if cmd == 'deploy':
            artefactPath = os.path.join(getRootDir(), self.getPath())
            if os.path.exists(artefactPath):
                manifestPath = os.path.join(getRootDir(), self.getPath(), 'manifest.ini')
                try:
                    with open(manifestPath,'w') as manifest:
                        self.genManifest(manifest)
                except:
                    pass

                # Artefact copy to local NFS to avoid downloading
                if artefactCache.canInstall():
                    artefactCache.install(self.name, self.version, artefactPath)

                artefactDir = os.path.join(getRootDir(), 'artefacts')
                try:
                    os.makedirs(artefactDir)
                except:
                    pass
                cwd = getRootDir()
                os.chdir(self.getPath())
                t = tarfile.open(os.path.join(artefactDir, self.artefact + '.tar.bz2'), 'w:bz2')
                t.add('.')
                t.close()
                os.chdir(cwd)

                repo = ci.ArtefactRepositorySet(distrib=self.distrib)
                if self.version == 'dev': version = self.getHash()
                else: version = self.version

                artefact = repo.newArtefact(files=[manifestPath, 'artefacts/%s.tar.bz2' % (self.artefact)], group='pulp', artefact=self.artefact, branch='mainstream', version=version, build='0', linkToDistrib=self.linkToDistrib)
                artefact.deploy()
                artefact.close()

                if db != None:
                    self.setDbArtefactId(db, pkgBuildId, artefact.buildId)
            else:
                raise Exception("Didn't find artefact: " + artefactPath)
        else:

            for fullName, module in self.modules:

                if not all:
                    skipConfig = True
                    for specConfig in configs:
                        config = pulpconfig.getConfig(**specConfig).getConfigItems()
                        skip = False
                        for constraint in module.constraints:
                            if not eval(constraint): 
                                skip = True
                                break
                        if skip: continue  
                        skipConfig = False
                        break
                    if skipConfig: continue

                ret = 0

                if not buildAll and not module.mustBuild: continue

                if testsuites != None and module.testsuite != None and self.hasTestsuite:
                    testsuites.append([module.name, os.path.join(module.path, module.testsuite)])

                os.environ['SRC_VERSION'] = module.version
                os.environ['BUILD_DIR'] = os.path.join(getRootDir(), 'build', self.name, module.name)

                if not step and cmd == 'checkout':
                    if module.url != None:
                        module.dumpMsg(self, cmd)
                        ret = 0
                        if not os.path.exists(module.path):
                            if execute("git clone %s %s" % (module.url, module.path)) != 0:  
                                self.clearEnv()
                                return -1
                        cwd = getRootDir()
                        os.chdir(module.path)
                        ret = execute("git fetch")
                        ret = execute("git checkout %s" % (module.version))

                        if check_output('git log -n 1 --format=format:%H'.split()).decode('utf-8') != module.version:
                            execute("git pull")
                        os.chdir(cwd)

                else:
                    cmdName = cmd
                    if step:
                        cmdStep = module.steps.get(cmd)
                    else:
                        cmdStep = cmd
                        cmdName = 'custom'
                    if cmdStep != None:
                        module.dumpMsg(self, cmd)
                        cwd = getRootDir()
                        os.chdir(module.path)
                        ret = module.execCmd(cmdName, cmdPrefix + cmdStep, configs)
                        os.chdir(cwd)
                if not ignoreErrors and ret != 0: 
                    self.clearEnv()
                    return -1

        self.clearEnv()
        return 0

    def evalEnvDef(self, str):
        return eval(str)

    def getPkgEnvFileName(self, isCsh):
        if isCsh: return 'env-%s-%s.csh' % (self.name, self.version)
        else: return 'env-%s-%s.sh' % (self.name, self.version)

    def genPkgEnv(self, envFile, isCsh, genSource=True, forceExport=True):
        for envName, envValue in self.envDefs.items():
            if isCsh: envFile.write('setenv %s %s\n' % (envName, self.evalEnvDef(envValue)))
            else: envFile.write('export %s=%s\n' % (envName, self.evalEnvDef(envValue)))
            os.environ[envName] = eval(envValue)
        for env in self.envs:
            if forceExport:
                if isCsh: envFile.write('setenv %s %s\n' % (env, os.path.join(getRootDir(), self.getPath())))
                else: envFile.write('export %s=%s\n' % (env, os.path.join(getRootDir(), self.getPath())))
            else:
                if isCsh: envFile.write('if ( -e %s ) setenv %s %s\n' % (os.path.join(getRootDir(), self.getPath()), env, os.path.join(getRootDir(), self.getPath())))
                else: envFile.write('if [ -e %s ]; then export %s=%s; fi\n' % (os.path.join(getRootDir(), self.getPath()), env, os.path.join(getRootDir(), self.getPath())))
        if isCsh: envFileName = self.cshEnvFile
        else: envFileName = self.envFile
        if envFileName != None:

            filePath = os.path.join(getRootDir(), self.getPath(), envFileName)
            if genSource:
                script = os.path.join(getRootDir(), self.getPath(), envFileName)
                if isCsh: envFile.write('if ( -e %s ) source %s\n' % (script, script))
                else: envFile.write('if [ -e %s ]; then . %s; fi\n' % (script, script))
        

class Plp_submodules(object):

    def getCmdPrefix(self):
        return '. %s && ' % (self.genEnv())

    def getPkgEnvFilePath(self, pkg, isCsh=None):
        if isCsh == None: isCsh = self.isCsh
        return os.path.join(getRootDir(), 'env', pkg.getPkgEnvFileName(isCsh))

    def genEnv(self):
        if self.globalEnvFilePath == None:
            cshFile = self.genEnvForShell(isCsh=True)
            shFile = self.genEnvForShell(isCsh=False)
            if self.isCsh: self.globalEnvFilePath = cshFile
            else: self.globalEnvFilePath = shFile

        if os.path.exists(self.globalEnvFilePath): return self.globalEnvFilePath
        else: return None

    def genEnvForShell(self, isCsh=False):

            global genGlobalEnvFileHeader
            global genGlobalEnvFileHeaderCsh

            if isCsh: globalEnvFilePath = os.path.join(getRootDir(), 'sourceme.csh')
            else: globalEnvFilePath = os.path.join(getRootDir(), 'sourceme.sh')
            if os.path.exists(globalEnvFilePath):
                os.remove(globalEnvFilePath)

            dumpedPkg = []

            for pkg in self.packagesList:

                envFilePath = self.getPkgEnvFilePath(pkg, isCsh=isCsh)
                try:
                    os.makedirs('env')
                except:
                    pass
                with open(envFilePath,'w') as envFile:
                    genEnvHeader(self.distrib, envFile, isCsh)
                    for pkgEnv in pkg.getActiveDeps() + [pkg]:
                        pkgEnv.genPkgEnv(envFile, isCsh=isCsh)
                
                # Old script that relies on scripts under env/
                #with open(globalEnvFilePath, 'a') as globalEnvFile:
                #    if self.isCsh: globalEnvFile.write("if ( -e %s ) source %s\n" % (envFilePath, envFilePath))
                #    else: globalEnvFile.write("if [ -e %s ]; then . %s; fi\n" % (envFilePath, envFilePath))

                for pkgEnv in pkg.deps + [pkg]:
                    if pkgEnv in dumpedPkg: continue
                    dumpedPkg.append(pkgEnv)

                    with open(globalEnvFilePath, 'a') as globalEnvFile:
                        if isCsh:
                            if not genGlobalEnvFileHeaderCsh:
                                genGlobalEnvFileHeaderCsh = True
                                genEnvHeader(self.distrib, globalEnvFile, isCsh)
                        else:
                            if not genGlobalEnvFileHeader:
                                genGlobalEnvFileHeader = True
                                genEnvHeader(self.distrib, globalEnvFile, isCsh)
                        pkgEnv.genPkgEnv(globalEnvFile, isCsh=isCsh)

            return globalEnvFilePath

    def getBuildPkg(self):
        packages = []
        for pkg in self.packagesList:
            if pkg.mustBuild and (pkg.active or self.all):
                packages.append(pkg)
        return packages

    def getConfigs(self):
        configs = []

        for config in self.configs:
            drop = False

            # In case we added options based on config items specified in modules.ini
            # take them into account in case they are specified
            if self.args != None:
                for configItem in pulpconfig.getConfigItems():
                    value = self.args.__dict__.get(configItem)
                    if value != None:

                        if not value in pulpconfig.getConfigItemValues(configItem):
                            raise Exception('Undefined value specified: ' + value + ' for config item: ' + configItem)

                        # In case the config item exists and is different, drop the config
                        if config.get(configItem) != None and config.get(configItem) != value:
                            drop = True
                            break
                        # Otherwise add the specified value in order to overwrite the default value
                        config[configItem] = value

            if not drop: 
                configs.append(pulpconfig.getConfig(**config))

        return configs

    def getPkgArtefact(self, pkg, force=False):
        if not pkg.hasArtefact: return None

        if not os.path.exists(pkg.getPath()) or force:

            if os.path.exists(pkg.getPath()): 
                print ('Specified --force option, removing directory: ' + pkg.getPath())
                if os.path.isdir(pkg.getPath()) and not os.path.islink(pkg.getPath()): shutil.rmtree(pkg.getPath())
                else: os.unlink(pkg.getPath())

            if not artefactCache.getPkg(pkg.name, pkg.version, pkg.getPath()):

                logging.debug("Getting package '%s' with hash: %s and hashString: %s" % (pkg.name, pkg.getHash(), pkg.getHashStr()))

                repo = ci.ArtefactRepositorySet(distrib=self.distrib)
                try:
                    artefact = repo.getArtefact(id=None, group='pulp', artefact=pkg.artefact, branch='mainstream', version=pkg.getVersion(), build='0', unpack=True, linkToDistrib=pkg.linkToDistrib)
                except:
                    raise

                print ('\033[1m' + '%s' % (pkg.artefact) + '\033[0m' + ': Getting artefact')
                #logging.debug("Getting artefact at: %s" % (artefact.path))

                artefact.get(pkg.getPath())
                artefact.close()
                return artefact
        else:
            print ('\033[1m' + '%s' % (pkg.artefact) + '\033[0m' + ': Already at %s, remove directory to get it again' % (pkg.getPath()))

        return None
        
    def getPkgsArtefact(self, pkg, pkgList, executedPkgs=[]):
        for dep in pkgList:
            if dep.active and not dep in executedPkgs:
                artefact = self.getPkgArtefact(dep)
                #if artefact != None and self.db != None:
                #    pkg.setDbDep(self.db, pkg, int(artefact.buildId), currentBuildId=int(self.pkgBuildId))

    def _filterPackages(self, packages, packagesRegExps):
        
        # Only overwrite previous settings if there is something specified in order to get
        # First from versions.ini then environment variables and then from command-line
        if len(packages) == 0 and len(packagesRegExps) == 0: return

        for pkg in self.packages.values():
            # First mark it as non-buildable as each option is overwriting the others
            pkg.mustBuild = False
            found = False
            # A package is active if it is found either in the package list
            if pkg.name in packages: found = True
            # Or match any reg exp
            for regExp in packagesRegExps:
                if re.compile(regExp).search(pkg.name):
                    found = True
                    break
            if found: 
                pkg.mustBuild = True
        
    def _filterModules(self, modules, modulesRegExps):
        # Only overwrite previous settings if there is something specified in order to get
        # First from versions.ini then environment variables and then from command-line
        # Except that we invalidate modules that are not in a buildable package
        if len(modules) == 0 and len(modulesRegExps) == 0:
            for module in self.modules.values():
                found = False
                for package in module.packages:
                    if package.mustBuild:
                        found = True
                if not found: module.mustBuild = False
            return

        for module in self.modules.values():
            # First mark it as non-buildable as each option is overwriting the others
            module.mustBuild = False

            # A module is built only if it belongs to at least one package that must be
            # built
            found = False
            for package in module.packages:
                if package.mustBuild:
                    found = True
                    break
            if not found: continue

            found = False
            if module.name in modules: found = True
            for regExp in modulesRegExps:
                if re.compile(regExp).search(module.name):
                    found = True
                    break
            if found: module.mustBuild = True

    def parseFile(self, modulesFile, configs):

        config = configparser.SafeConfigParser(dict_type=collections.OrderedDict)
        config.optionxform = str
        openedPaths = config.read(modulesFile)
        if len(openedPaths) == 0:
            print ("Didn't manage to open config file: %s" % (modulesFile))
            raise BaseException

        for section in config.sections():
            if section == 'modules':
                for (moduleName, moduleVersion) in config.items(section):
                    module = self.modules.get(moduleName)
                    if module == None: raise NameError("Unknown module specified: %s\n" % (moduleName))
                    module.version = moduleVersion
            elif section == 'env':
                for (key, value) in config.items(section):
                    if os.environ.get(key) == None:
                        os.environ[key] = value
            elif section == 'config':
                configs = []
                for (key, value) in config.items(section):
                    if key == 'configs': configs = value
                    elif key == 'constraints': self.constraints = value
                self.configsRegexps = configs

            elif section == 'build':
                packages = []
                packagesRe = []
                modules = []
                modulesRe = []
                for (itemName, itemValue) in config.items(section):
                    if itemName == 'packages':
                        packages = itemValue.split()
                    elif itemName == 'packages-re':
                        packagesRe = itemValue.split()
                    elif itemName == 'modules':
                        modules = itemValue.split()
                    elif itemName == 'modules-re':
                        modulesRe = itemValue.split()
                    else:
                        raise BaseException('Unknown item %s in section %s' % (itemName, section))

                self._filterPackages(packages, packagesRe)
                self._filterModules(modules, modulesRe)


            elif section == 'packages':
                for (pkgName, pkgVersion) in config.items(section):

                    pkg = self.packages.get(pkgName)
                    if pkg == None: raise NameError("Unknown package specified: %s\n" % (pkgName))
                    pkg.version = pkgVersion
                    if pkg.envVersionName != None:
                        envVersion = os.environ.get(pkg.envVersionName)
                        if envVersion != None:
                            pkg.version = envVersion

            elif section == 'branches':
                for (moduleName, branch) in config.items(section):
                    self.modules[moduleName].branch = branch

            elif section.find('module:') == 0:
                moduleName = section.split(':')[1]
                module = Submodule(moduleName, getRootDir(), self.log, self.stdout)
                self.modules[moduleName] = module
                for itemName in config.options(section):
                    itemValue = config.get(section, itemName, vars={'curdir':getRootDir()})
                    if itemName == 'url':
                        module.url = itemValue
                    elif itemName == 'path':
                        module.path = os.path.join(getRootDir(), itemValue)
                    elif itemName == 'testsuite':
                        module.testsuite = itemValue
                    elif itemName == 'folders':
                        module.folders = itemValue.split()
                    elif itemName == 'builder.constraint':
                        module.constraints.append(itemValue)
                    elif itemName == 'builder.nbWorkers':
                        module.cmdNbWorkers = int(itemValue)
                    elif itemName == 'parameters':
                        module.parameters = itemValue.split()
                    elif itemName == 'builder':
                        module.loadBuilder(itemValue, getRootDir())
                    elif itemName == 'clean' or itemName == 'checkout' or itemName == 'header' or itemName == 'build' or itemName == 'deploy' or itemName == 'test':
                        module.steps[itemName] = itemValue
                    else:
                        raise BaseException('Unknown item %s in section %s' % (itemName, section))
            elif section.find('package:') == 0:
                pkgName = section.split(':')[1]
                pkg = Package(pkgName, self.distrib, self.gitVersion)
                self.packages[pkgName] = pkg
                self.packagesList.append(self.packages[pkgName])
                for itemName in config.options(section):
                    itemValue = config.get(section, itemName, vars={'curdir':getRootDir()})
                    if itemName == 'modules':
                        for moduleName in itemValue.split():
                            fullName = moduleName
                            if len(itemName.split('.')) >= 2:
                                fullName = itemName.split('.')[1] + '.' + moduleName
                            self.packages[pkgName].modules.append([fullName, self.modules[moduleName]])
                            self.modules[moduleName].packages.append(self.packages[pkgName])
                    elif itemName == 'commands':
                        self.packages[pkgName].commands = itemValue
                    elif itemName.find('subgroup') == 0:
                        name = itemName.split('.')[1]
                        self.subgroups[name] = itemValue
                    elif itemName == 'version':
                        self.packages[pkgName].envVersionName = itemValue
                    elif itemName == 'path':
                        self.packages[pkgName].path = os.path.join(getRootDir(), itemValue)
                    elif itemName == 'artefact':
                        self.packages[pkgName].artefact = itemValue
                    elif itemName == 'env':
                        pkg.envs.append(itemValue)
                    elif itemName.find('envDef.') == 0:
                        envName = itemName.split('.')[1]
                        envValue = itemValue
                        pkg.envDefs[envName] = itemValue
                    elif itemName == 'envFile':
                        self.packages[pkgName].envFile = itemValue
                    elif itemName == 'cshEnvFile':
                        self.packages[pkgName].cshEnvFile = itemValue
                    elif itemName == 'configs':
                        self.packages[pkgName].restrictConfigs = pulpconfig.createConfigsFromRegexp(itemValue)
                    elif itemName == 'deps':
                        for depName in itemValue.split():
                            self.packages[pkgName].deps.append(self.packages[depName])
                    elif itemName == 'constraint':
                        self.packages[pkgName].active = eval(itemValue)
                    elif itemName == 'hasArtefact':
                        pkg.hasArtefact = itemValue == 'true'
                    elif itemName == 'hasTestsuite':
                        pkg.hasTestsuite = itemValue == 'true'
                    elif itemName == 'description':
                        pkg.description = itemValue
                    elif itemName == 'properties':
                        for prop in itemValue.split():
                            name, value = prop.split('=')
                            if name == 'linkToDistrib': pkg.linkToDistrib = value == 'true'
                            else: raise Exception('Unknown property: ' + name)
                        pkg.description = itemValue
                    elif itemName == 'execDeps':
                        for depName in itemValue.split():
                            self.packages[pkgName].execDeps.append(self.packages[depName])
                    else:
                        raise BaseException('Unknown item %s in section %s' % (itemName, section))

                
            elif section.find('test:') == 0:
                testName = section.split(':')[1]
                for (itemName, itemValue) in config.items(section):
                    if itemName == 'configs':
                        self.testConfigs[testName] = itemValue.splitlines()
                    else:
                        raise BaseException('Unknown item %s in section %s' % (itemName, section))
            else:
                raise BaseException('Unknown section %s' % (section))

        return config


    def findActiveConfigs(self, configs):

        activeConfigs = []
        if len(configs) != 0:
            for config in pulpconfig.createConfigsFromRegexp(configs):
                #activeConfigs.append(config.getAll())
                activeConfigs.append(config.getSpecConfigItems())

        # Now filter out the configs depending on the constraints
        if self.constraints != None:
            filteredActiveConfigs = []
            for config in activeConfigs:
                # For each constraint either all items must match or none
                for constraint in self.constraints.split():
                    foundOne = False
                    foundAll = True
                    for item in constraint.split(':'):
                        key, val = item.split('=')
                        if config.get(key) != None:
                            if config.get(key) != val: foundAll = False
                            else: foundOne = True
                    if not foundOne or foundAll: filteredActiveConfigs.append(config)



            self.configs = filteredActiveConfigs
        else:
            self.configs = activeConfigs

    def jenkinsWait(self, invoke):
        invoke.block_until_complete()
        return invoke.get_build().is_good()

    def getJenkins(self):
        if self.jenkins == None:
            self.jenkins = Jenkins(self.jenkinsUrl, requester=Requester(baseurl=self.jenkinsUrl, username='ci', password='7cBHC9ZHqkaaGa7ujaxp', ssl_verify=False))
        return self.jenkins

    def jobOutput(self, job, build):
        return self.getJenkins().get_job(job).get_build(int(build)).get_console()

    def jobWait(self, job, build):
        print ("Waiting for job completion")
        build = self.getJenkins().get_job(job).get_build(int(build))
        build.block_until_complete()
        print ("Job has finished")

    def jobStatus(self, job, build):
        build = self.getJenkins().get_job(job).get_build(int(build)) 
        if build.is_running(): return "RUNNING"
        else: return build.get_status()

    def jenkinsExec(self, jobName, cmd=None, cmdList=None, block=True):
        repo = ci.ArtefactRepository(distrib=self.distrib)
        J = self.getJenkins()
        #self.initDb()
        distrib = self.distrib
        params = {'Node' : distrib, 'command' : cmd, 'version' : self.topVersion}
        if cmdList != None:
            for index in range(0, len(cmdList)):
                params['command%d' % index] = cmdList[index]
        else:
            print (cmd)
            params['command'] = cmd
        invoke = J.get_job(jobName).invoke(build_params=params, block=block)
        if block:
            return invoke.get_build().is_good()
        else:
            invoke.block_until_building()
            return invoke

    def jenkinsExecWait(self, invoke):
        while True:
            try:
                invoke.block_until_complete()
                break
            except:
                print ('WARNING: connection issue while waiting for job completion, retrying in 5 seconds')
                time.sleep(5)
        return invoke.get_build().is_good()

    def getDb(self):
        self.initDb()
        return self.db
        

    def initDb(self):
        self.db = pulpdb.PulpDb()
        self.db.createTables()

    def __init__(self, log=None, stdout=False, parser=None, modulesFile=None, configFile=None, versionsFile=None, distrib=None, packages=[], packagesRegExps=[], subgroups=[], modules=[], modulesRegExps=[], versions=None, versionList=None, pkgBuildId=None, version=None, ips=[], auto=False, isCsh=False, all=False, force=False):

        jenkinsAddr = os.environ.get('JENKINS_IP_ADDR')
        if jenkinsAddr == None:
            jenkinsAddr = 'iis-jenkins.ee.ethz.ch'
            #jenkinsAddr = '129.132.2.51:8443'
        jenkinsUrl='https://%s' % (jenkinsAddr)
        self.jenkinsUrl = jenkinsUrl
        self.jenkins = None

        if configFile == None: configFile = os.path.join(getRootDir(), 'config.ini')
        if modulesFile == None: modulesFile = os.path.join(getRootDir(), 'modules.ini')
        if versionsFile == None: versionsFile = os.path.join(getRootDir(), 'versions.ini')
        self.versionsFilePath = versionsFile

        self.gitVersion = getGitVersion(getRootDir())

        self.isCsh = isCsh
        self.force = force

        self.log = log
        self.stdout = stdout
        self.globalEnvFilePath = None
        self.pkgBuildId = pkgBuildId
        self.db = None
        self.configsRegexps = []
        self.subgroups = {}
        if pkgBuildId != None:
            self.initDb()
        self.modules = {}
        self.packages = {}
        self.packagesList = []
        if version != None:
            self.topVersion = version
        else:
            self.topVersion = self.gitVersion
        self.versions = versions
        self.version = {}
        self.all = all
        self.testConfigs = {}
        self.configs = {}
        self.constraints = None
        if versionList != None:
            for version in versionList:
                self.version[version.split('=')[0]] = version.split('=')[1]

        if len(ips) != 0:
            os.environ['PULP_IPS'] =  ' '.join(ips)

        if os.environ.get('PULP_DISTRIB') != None:
            distrib = os.environ.get('PULP_DISTRIB')

        if distrib == None:
            dist = subprocess.Popen("lsb_release -a | grep Distributor | awk '{print $3}'", shell=True, stdout=subprocess.PIPE, universal_newlines=True).stdout.read().strip()
            version = subprocess.Popen("lsb_release -a | grep Release | awk '{print $2}'", shell=True, stdout=subprocess.PIPE, universal_newlines=True).stdout.read().strip().split('.')[0]
            distrib = '%s_%s' % (dist, version)

            # Map all LinuxMint and Ubuntu < 16 versions to Ubuntu 14
            if distrib.find('LinuxMint') != -1 or distrib.find('Ubuntu') != -1:
                if dist != 'Ubuntu' or int(version.split('.')[0]) < 16:
                    distrib = 'Ubuntu_14'
                    version = '14'
            if distrib.find('CentOS') != -1:
                distrib = 'CentOS_6'
                version = '6'

        self.distrib = distrib
        properties = {'distribution': distrib}

        if distrib.lower().find('centos') != -1:
            if os.environ.get('LD_LIBRARY_PATH') == None: os.environ['LD_LIBRARY_PATH'] = ''
            os.environ['LD_LIBRARY_PATH'] = '/usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64:' + os.environ.get('LD_LIBRARY_PATH')
            if os.environ.get('PATH') == None: os.environ['PATH'] = ''
            os.environ['PATH'] = '/usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/bin:/usr/pack/ant-1.9.6-gh/bin:%s/centos/bin:' % (getRootDir()) + os.environ.get('PATH')
            os.environ['JAVA_HOME'] = '/usr/pack/jdk-1.6.0-mo/i686-debian-linux4.0/jdk1.6.0'
 
        # First parse the modules file to get description for all packages and modules
        if os.path.exists(configFile): self.configFile = self.parseFile(configFile, self.configs)
        if os.path.exists(modulesFile): self.modulesFile = self.parseFile(modulesFile, self.configs)

        # And then get the versions
        if os.path.exists(versionsFile): self.versionsFile = self.parseFile(versionsFile, self.configs)

        if parser != None:
            for configItem in pulpconfig.getConfigItems():
                parser.add_argument("--" + configItem, dest=configItem, default=None, help="Sets " + configItem)
            [self.args, otherArgs] = parser.parse_known_args()


        envPackages = []
        envPackagesRegExps = []
        envModules = []
        envModulesRegExps = []
        if os.environ.get('PULP_PACKAGES') != None:
            envPackages = os.environ.get('PULP_PACKAGES').split()
        if os.environ.get('PULP_PACKAGES_RE') != None:
            envPackagesRegExps = os.environ.get('PULP_PACKAGES_RE').split()
        if os.environ.get('PULP_MODULES') != None:
            envModules = os.environ.get('PULP_MODULES').split()
        if os.environ.get('PULP_MODULES_RE') != None:
            envModulesRegExps = os.environ.get('PULP_MODULES_RE').split()
                        

        if os.environ.get('PULP_CONFIGS') != None:
            self.configsRegexps = os.environ.get('PULP_CONFIGS')
            # Now that we got the env var, remove it to avoid recursive behavior
            del os.environ['PULP_CONFIGS']

        self.findActiveConfigs(self.configsRegexps)

        for pkg in self.packagesList:
            pkg.checkConfigs(self.configs)

        if auto:
            # In automatic mode, parse the configurations string to append required groups
            for config in self.configs:
                config = pulpconfig.createConfig(**config)
                groups = config.getGroups()
                for group in groups:
                    if not group in subgroups: subgroups.append(group)

        # Now filter out the packages and modules first from env vars
        for subgroup in subgroups:
            value = self.subgroups.get(subgroup)
            if value == None:
                raise NameError('Unknown subgroup: %s' % (subgroup))
            modules += value.split()

        self._filterPackages(envPackages, envPackagesRegExps)
        self._filterModules(envModules, envModulesRegExps)

        # And then from the command line
        self._filterPackages(packages, packagesRegExps)
        self._filterModules(modules, modulesRegExps)
            
        for moduleName, module in self.modules.items():
            if self.versions != None:
                module.version = self.versions
            moduleVersion = self.version.get(module.name)
            if moduleVersion != None:
                module.version = moduleVersion

    def writePkgVersionsFile(self):
        versionsFile = self.versionsFilePath
        with open(versionsFile,'w') as manifest:
            
            for pkg in self.getBuildPkg():
                self.versionsFile.set('packages', pkg.name, pkg.version)

            self.versionsFile.write(manifest)

    def writeVersionsFile(self):
        versionsFile = self.versionsFilePath
        with open(versionsFile,'w') as manifest:
            
            for module in self.modules.values():
                if module.mustBuild and module.url != None:
                    self.versionsFile.set('modules', module.name, module.getGitVersion())

            self.versionsFile.write(manifest)

    def clean(self):
        for pkg in self.getBuildPkg():
            if pkg.clean(self, configs=self.configs) != 0: return -1
        return 0

    def checkout(self):
        for pkg in self.getBuildPkg():
            if pkg.checkout(self, configs=self.configs, all=self.all) != 0: return -1
        return 0

    def tag(self, version):
        for pkg in self.getBuildPkg():
            pkg.tagVersion = version
        self.genEnv()
        for pkg in self.getBuildPkg():
            if self.downloader(pkg) != 0: return -1

        return 0


    def info(self):
        print ('GIT top module version: ' + getGitVersion(getRootDir()))
        print ('')
        print ('GIT module versions:')
        for module in self.modules.values():
            if module.mustBuild and module.url != None:
                gitVersion = module.getGitVersion()
                if module.isModified(): gitVersion += ' (modified)'
                print ("  %s: %s" % (module.name, gitVersion))
        print ('')
        print ('Dependencies versions:')
        for pkg in self.getBuildPkg():
            for dep in pkg.getActiveExecDeps():
                print ('  %s: %s' % (dep.name, dep.version))

        return 0


    def updateVersions(self):
        self.execCmd('versions')
        return 0

    def build(self):
        for pkg in self.getBuildPkg():
            if pkg.build(self, configs=self.configs) != 0: return -1
        return 0

    def buildPkgAndDeps(self, pkg, local, failings, done, indent):

        invokes = []
        failed = False

        # If the package has already been built and failed returns an error
        if failings.get(pkg.name) != None: return True, None, False
        if done.get(pkg.name) != None: return False, None, False

        if not pkg.shouldBuildArtefact(self, configs=self.configs): 
            return False, None, False

        print (indent + 'BUILDING %s' % (pkg.name))

        for dep in pkg.deps + pkg.execDeps:
            depStatus, depInvoke, built = self.buildPkgAndDeps(dep, local=local, failings=failings, done=done, indent=indent + '  ')
            if depInvoke == None:
                if built:
                    if depStatus: print (indent + 'FAILED %s' % (dep.name))
                    else: print (indent + 'DONE %s' % (dep.name))
            done[dep.name] = dep
            failed = failed or depStatus
            if depInvoke != None: invokes.append([dep, depInvoke])

        for invoke in invokes:
            logging.debug('%s: Waiting for job' % (invoke[0].name))
            if self.submit_wait(invoke[1], log=False) != 0: 
                failed = True
                failings[invoke[0].name] = invoke[0]
                print (indent + 'FAILED %s' % (invoke[0].name))
            else: print (indent + 'DONE %s' % (invoke[0].name))
            logging.debug('%s: Job finished' % (invoke[0].name))

        if failed: 
            return failed, None, True

        if local:
            failed = self.execCmd('plpbuild --all --p %s %s --stdout' % (pkg.name, pkg.commands)) != 0
            if failed: failings[pkg.name] = pkg
            done[pkg.name] = pkg
            return failed, None, True
        else:
            logging.debug('%s: Submitting job' % (pkg.name))
            invoke = self.submit_async(['plpbuild --all --p %s %s --stdout' % (pkg.name, pkg.commands)], block=False, job='%s_%s' % (pkg.name, self.distrib))
            return False, invoke, True

    def pipeline(self, local):
        failings = {}
        done = {}
        failed = False
        for pkg in self.getBuildPkg():
            pkgFailed, invoke, built = self.buildPkgAndDeps(pkg, local=local, failings=failings, done=done, indent='')
            done[pkg.name] = pkg
            if not pkgFailed:
                if invoke != None:
                    logging.debug('%s: Waiting for job' % (pkg.name))
                    if self.submit_wait(invoke, log=False) != 0:
                        pkgFailed = True
                    logging.debug('%s: Job finished' % (pkg.name))
            if pkgFailed:
                failings[pkg.name] = pkg
                failed = True

            if built:
                if pkgFailed: print ('FAILED %s' % (pkg.name))
                else: print ('DONE %s' % (pkg.name))

        if failed:
            print ('')
            print ('Following packages have failed:')
            for pkg in failings.values():
                print ('  %s' % pkg.name)

        if failed: return 1
        else: return 0

    def submitOld(self, cmd):
        for pkg in self.getBuildPkg():
            if pkg.submit(self, configs=self.configs, cmd=cmd) != 0: return -1
        return 0

    def downloader(self, pkg, distribs=None):
        if distribs == None: distribs = [self.distrib]
        for distrib in distribs:
            repo = ci.ArtefactRepository(distrib=distrib)
            downloaderFile = 'get-%s-%s-%s.py' % (pkg.name, pkg.getVersion(), distrib)
            with open(downloaderFile, 'w') as getFile:
                with open('bin/get.header','r') as header:
                    getFile.write(header.read())
                    
                artefacts = []
                 
                pkgList = [pkg] + pkg.getActiveExecDeps()
                for pkg2 in pkgList:
                    artefact = repo.getArtefact(id=None, group='pulp', artefact=pkg2.artefact, branch='mainstream', version=pkg2.getDevVersion(), build='LAST', unpack=True, linkToDistrib=pkg2.linkToDistrib)
                    artefacts.append('["%s/%s.tar.bz2", "%s"]' % (artefact.path, pkg2.name, pkg2.getRelativePath()))
                getFile.write('src="%s"\n' % (check_output('git log -n 1 --format=format:%H'.split()).decode('utf-8')))
                getFile.write('artefacts=[%s]\n' % (', '.join(artefacts)))

                with open(os.path.join(getRootDir(), self.getPkgEnvFilePath(pkg, isCsh=True)),'r') as envFile:envStrCsh = envFile.read().replace(getRootDir(), '@PULP_PKG_HOME@').replace(getRootDir(), '@PULP_PKG_HOME@')
                with open(os.path.join(getRootDir(), self.getPkgEnvFilePath(pkg)),'r') as envFile:envStr = envFile.read().replace(getRootDir(), '@PULP_PKG_HOME@').replace(getRootDir(), '@PULP_PKG_HOME@')
                getFile.write('envFileStrCsh=["%s"]\n' % '", "'.join(envStrCsh.replace('"', '\\"').split('\n')))
                getFile.write('envFileStr=["%s"]\n' % '", "'.join(envStr.replace('"', '\\"').split('\n')))
                getFile.write('pkg=["%s", "%s"]\n' % (pkg.name, pkg.getVersion()))
                with open('bin/get.footer','r') as footer:
                    getFile.write(footer.read())
            os.chmod(downloaderFile, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)

            print (downloaderFile)

        return 0

    def branch(self):
        for pkg in self.getBuildPkg():
            if pkg.branch(self, configs=self.configs) != 0: return -1
        return 0

    def submit_async(self, cmd, block, job, log=False):
        invoke = self.jenkinsExec(jobName=job, cmdList=cmd, block=False)
        print ('Submitted command to Jenkins:')
        print ('  Command     : %s' % (cmd))
        print ('  Job name    : %s' % (invoke.get_job_name()))
        print ('  Build number: %s' % (invoke.get_build_number()))
        print ('  URL         : %s' % (invoke.get_build().get_result_url()))
        return invoke

    def submit_wait(self, invoke, log):
        print ('Now waiting for command to complete')
        status = self.jenkinsExecWait(invoke)
        print ('Command has finished with status: %s' % ('success' if status else 'failure'))
        if log:
            print ('Command output:')
            print (invoke.get_build().get_console())
        return 0 if status else 1


    def submit(self, cmd, block, job, log=False):
        invoke = self.submit_async(cmd=cmd, block=block, job=job, log=log)
        if block:
            return self.submit_wait(invoke, log=log)
        else:
            return 0

    def deploy(self):
        for pkg in self.getBuildPkg():
            if pkg.deploy(self, configs=self.configs) != 0: return -1
        return 0

    def update(self, pkgVersion):
        for pkg in self.getBuildPkg():
            if pkg.update(self, configs=self.configs, version=pkgVersion) != 0: return -1
        return 0

    def deps(self):
        for pkg in self.getBuildPkg():
            if pkg.getDeps(self, configs=self.configs, force=self.force) != 0: return -1
        return 0

    def execCmd(self, cmd, versionsFile=None, ignoreErrors=False, testConfigs=None, silent=False):
        logging.debug("Executing command '%s'" % (cmd))

        envFilesStr = self.getCmdPrefix()

        executedPkgs = []

        if cmd == 'versions':
            self.writeVersionsFile()
        elif cmd.find('cicmd') == 0:
            cmd = cmd.replace('cicmd', '')
            J = Jenkins(self.jenkinsUrl, requester=Requester(baseurl=self.jenkinsUrl, ssl_verify=False))
            print (cmd)
            build = J.get_job('cicmd').invoke(build_params={'Node' : self.distrib, 'command' : cmd}, block=True).get_build()
            if  build.get_status() == 'FAILURE': return -1
                    
        else:
            testsuites = []

            for pkg in self.packagesList:

                if not pkg.mustBuild or not pkg.active:
                    continue
                   

            for pkg in self.packagesList:

                if not pkg.mustBuild or not pkg.active:
                    continue
                    
                logging.debug("Handling command on package '%s' with hash: %s and hashString: %s" % (pkg.name, pkg.getHash(), pkg.getHashStr()))

                #if not silent:
                #    print ()
                #    print ('\033[1m' + 'PACKAGE %s' % (pkg.name) + '\033[0m')

                executedPkgs.append(pkg)

                # Always save and restore the environment to not pollute other modules with the env var
                # we are adding
                oldEnviron = dict(os.environ)

                os.environ['ARTEFACT_VERSION'] = pkg.version
                os.environ['ARTEFACT_NAME'] = pkg.artefact
                os.environ['PKG_DIR'] = os.path.join(getRootDir(), pkg.getPath())
                if os.environ.get('MAKEFLAGS') != None:
                    os.environ['ROOT_MAKEFLAGS'] = os.environ.get('MAKEFLAGS')
                    del os.environ['MAKEFLAGS']
                wsPkg = os.environ.get('WORKSTATION_PKG')
                if wsPkg != None: os.environ['WORKSTATION_PKG'] = os.path.join(os.environ['PKG_DIR'], wsPkg)
                targetPkg = os.environ.get('TARGET_PKG')
                if targetPkg != None: os.environ['TARGET_PKG'] = os.path.join(os.environ['PKG_DIR'], targetPkg)

                #envFilesStr = ''
                #for dep in pkg.getActiveDeps():
                #    if dep.envFile != None and os.path.exists(dep.getPath()):
                #        envCmd = '. %s' % (os.path.join(getRootDir(), dep.getPath(), dep.envFile))
                #        envFilesStr += '%s && ' % (envCmd)

                #envFilesStr = '. %s && ' % (envFilePath)

                if cmd == 'testsuites':
                    if pkg.hasTestsuite:
                        if pkg.description != None: print ('\033[1m' + pkg.name + '\033[0m' + ': ' + pkg.description)
                        else: print ('\033[1m' + pkg.name + '\033[0m')

                elif cmd == 'downloader':
                    self.downloader(pkg)

                elif cmd == 'testsuites-checkout':
                    if pkg.hasTestsuite:
                        if pkg.execCmd(db=self.db, cmd='checkout', ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                    self.getPkgsArtefact(pkg, pkg.getActiveDeps(), executedPkgs)

                elif cmd.find('cimodcmd') == 0:
                    ciCmd = cmd.replace('cimodcmd', '') + ' PACKAGES=%s' % (pkg.name)
                    J = Jenkins(self.jenkinsUrl, requester=Requester(baseurl=self.jenkinsUrl, ssl_verify=False))
                    build = J.get_job(pkg.name).invoke(build_params={'Node' : self.distrib, 'command' : ciCmd}, block=True).get_build()
                    if  build.get_status() == 'FAILURE': return -1
                    
                elif cmd == 'tag':
                    print (pkg.getVersion())
                elif cmd == 'build':
                    if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, cmd='header', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                    if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, cmd='build', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                elif cmd == 'clean':
                    if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, cmd='clean', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                elif cmd == 'deploy':
                    if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, cmd='deploy', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                elif cmd == 'test':
                    if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, testsuites=testsuites, cmd='test', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                elif cmd == 'get':
                    self.getPkgArtefact(pkg)
                    self.getPkgsArtefact(pkg, pkg.getActiveDeps(), executedPkgs)
                elif cmd == 'deps' or cmd == 'execdeps':

                    if cmd == 'deps':
                        depList = pkg.deps
                    else:
                        depList = pkg.execDeps     
                    self.getPkgsArtefact(pkg, depList, executedPkgs)

                else:
                    if pkg.execCmd(db=self.db, cmd=cmd, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1
                    if cmd == 'checkout':
                        if pkg.execCmd(db=self.db, cmdPrefix=envFilesStr, cmd='checkout', step=True, ignoreErrors=ignoreErrors, pkgBuildId=self.pkgBuildId, configs=self.configs, all=self.all) != 0: return -1


                if testConfigs == None:
                    testConfigs = []
                    for testConfigsList in self.testConfigs.values():
                        testConfigs += testConfigsList

                # Command is done, restore the environment
                os.environ.clear()
                os.environ.update(oldEnviron)

            if cmd == 'ci':
                pkgList = []
                for pkg in executedPkgs:
                    pkgList.append(pkg)
                
                envList = []
                for pkg in executedPkgs:
                    for dep in pkg.deps+pkg.execDeps:
                        env = '%s=%s' % (dep.name, dep.getVersion())
                        if not env in envList:
                            envList.append(env)
                    env = '%s=%s' % (pkg.name, pkg.getVersion())
                    if not env in envList:
                        envList.append(env)

                builds = []

                for pkg in pkgList:
                    if not pkg.hasTestsuite: continue

                    logging.debug('%s: launching virtual platform tests' % (pkg.name))
                
                    jobName = '%s_valid' % (pkg.name)
                    builds.append(self.jenkinsExec(jobName , 'make checkout get testset test PACKAGES=%s ENV=%s' % (pkg.name, ':'.join(envList)), block=False))
                    if self.distrib.lower().find('centos') != -1:
                        logging.debug('%s: launching RTL tests' % (pkg.name))
                        builds.append(self.jenkinsExec(jobName + '-rtl', 'make checkout get testset test.rtl PACKAGES=%s ENV=%s' % (pkg.name, ':'.join(envList)), block=False))

                        logging.debug('%s: launching FPGA tests' % (pkg.name))
                        builds.append(self.jenkinsExec(jobName + '-fpga', 'make checkout get testset test.fpga PACKAGES=%s ENV=%s' % (pkg.name, ':'.join(envList)), block=False))

                #for build in builds:
                #    self.jenkinsWait(build)

            

            if len(testsuites) != 0:
                with open('testset.ini','w') as testsetFile:
                    with open('testset.ini.header','r') as header:
                        testsetFile.write(header.read() % (' '.join(testConfigs)))

                    testsetPathList = []
                    for testset, testsetPath in testsuites:
                        testsetPathList.append(testsetPath)
                    testsetFile.write('\n[testset:pkg:tests]\nfiles=%s\n' % (' '.join(testsetPathList)))

                ciCmd = './bin/pulp-runtest --testset=testset.ini --max-timeout=600'
                if self.pkgBuildId != None:
                    ciCmd += ' --pkg=%s' % (self.pkgBuildId)
                #if os.system(envFilesStr + ciCmd) != 0: return -1

        return 0

