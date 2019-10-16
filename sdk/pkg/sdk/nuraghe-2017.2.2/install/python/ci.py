import os.path
from artifactory import ArtifactoryPath
import tarfile
import subprocess
import os
#import MySQLdb as mdb
import time
import logging
import sys

class DbDependency(object):
    def __init__(self, pipe, name):
        self.name = name
        self.pipe = pipe
        
    def get(self):
        artefact = self.pipe.getArtefact(self.name)
        if artefact != None:
            return artefact
        else:
            return self.pipe.getProperty(self.name)
            

class DbProperty(object):
    def __init__(self, pipe, name, value):
        self.name = name
        self.value = value
        self.pipe = pipe
        self.isArtefact = False
        self.id = None
        
    def getValue(self): return self.value
        
    def getId(self):
        if self.id == None:
            while True:
                rows = self.pipe.getDb().execCmd("SELECT * FROM properties WHERE name='%s' AND value='%s';" % (self.name, self.value))
                if len(rows) == 0:
                    self.pipe.getDb().execCmd("INSERT INTO properties(name,value) VALUES('%s','%s');" % (self.name, self.value))
                    continue
                else:
                    self.id = rows[0]['id']
                    break
                    
        return self.id
        
    def commit(self, dryrun=False):
        pass

class DbArtefact(object):
    def __init__(self, pipe, name, url, version):
        self.name = name
        self.url = url
        self.version = version  
        self.pipe = pipe  
        self.deps = []
        self.id = None
        self.depsId = []
        self.propsId = []
        self.isArtefact = True
        
    def getVersion(self):
        return self.version
        
    def getPropsString(self):
        return ','.join(self.propsId)
    
    def getDepsString(self):
        return ','.join(self.depsId)
        
    def getId(self):
        if self.id == None:
            depsId = []
            propsId = []
            for dep in self.deps:
                dep = dep.get()
                if dep.isArtefact:
                    depsId.append(str(dep.getId()))
                else:
                    propsId.append(str(dep.getId()))
            self.depsId = sorted(depsId)
            self.propsId = sorted(propsId)
            while True:
                rows = self.pipe.getDb().execCmd("SELECT * FROM artefacts WHERE name='%s' AND tag='%s' AND properties='%s' AND dependencies='%s';" % (self.name,self.version,self.getPropsString(),self.getDepsString()))
                if len(rows) == 0:
                    self.pipe.getDb().execCmd("INSERT INTO artefacts(name,url,tag,properties,dependencies) VALUES('%s','%s','%s','%s','%s');" % (self.name,self.url,self.version,self.getPropsString(),self.getDepsString()))
                    continue
                else:
                    self.id = rows[0]['id']
                    break
                
        return self.id
    
    def fetch(self, repo, path, group, build):
        artefact = repo.getArtefact(group=group, artefact=self.name, branch=None, version=str(self.getId()), id=self.pipe.getId(), build=build, unpack=True)
        artefact.get(path)
        artefact.close()
    
    def fetchDeps(self, repo, path, group, build):
        for dep in self.deps:
            dep = dep.get()
            if dep.isArtefact:
                dep.fetch(repo, path, group, build)
    
    def getProperty(self, name):
        for dep in self.deps:
            dep = dep.get()
            if not dep.isArtefact:
                if dep.name == name:
                    return dep.value
        return None
            
    def addDependency(self, name):  
        dep = DbDependency(self.pipe, name)
        self.deps.append(dep)
        return dep  
    
    def commit(self, dryrun=False):
        print ("  Artefact name: %s url: %s version: %s id: %d" % (self.name, self.url, self.version, self.getId()))
        for dep in self.deps:
            dep = dep.get()
            if dep.isArtefact:
                print ("    Dependency name: %s url: %s version: %s id: %d" % (dep.name, dep.url, dep.version, dep.getId()))
            else:
                print ("    Property name: %s value: %s id: %d" % (dep.name, dep.value, dep.getId()))

    def isBuilt(self):
        return len(self.pipe.getDb().execCmd("SELECT * FROM builds WHERE artefact=%s;" % (self.getId()))) != 0

    def regBuild(self, status='PASSED', nbTests=0, nbTestsPassed=0):
        self.pipe.getDb().execCmd("INSERT INTO builds(artefact,status,tests,tests_passed) VALUES('%d','%s','%d','%d');" % (self.getId(), status, nbTests, nbTestsPassed))
        
    def build(self, forceList):
            if (forceList != None and self.name in forceList) or not self.isBuilt():
                for dep in self.deps:
                    dep = dep.get()
                    if dep.isArtefact and not dep.isBuilt():
                        return
                print ("Raising build %s(%s)" % (self.name, self.version) )   
                os.system('curl -k -X POST https://%s/job/%s_pipe/build --data token=TOKEN --data-urlencode json=\'{"parameter": [{"name":"VERSION", "value":"%s"},{"name":"PIPELINE", "value":"%s"},{"name":"Node", "value":"%s"}]}\'' % (os.environ['JENKINS_IP_ADDR'], self.name, self.version, self.pipe.getId(), self.getProperty('distribution')))
    

class DbPipeline(object):
    def __init__(self, db, name, tag, id=None):
        self.name = name
        self.tag = tag
        self.db = db
        self.artefacts = []
        self.artefactsDict = {}
        self.properties = []
        self.propertiesDict = {}
        self.id = id
        
    def getId(self):
        if self.id == None:
            while True:
                rows = self.db.execCmd("SELECT * FROM pipelines WHERE name='%s' AND tag='%s' AND artefacts='%s' AND properties='%s';" % (self.name,self.tag,self.getDepsString(),self.getPropsString()))
                if len(rows) == 0:
                    self.db.execCmd("INSERT INTO pipelines(name,tag,artefacts,properties) VALUES('%s','%s','%s','%s');" % (self.name,self.tag,self.getDepsString(),self.getPropsString()))
                    continue
                else:
                    self.id = rows[0]['id']
                    break
        return self.id
        
    def getDb(self):
        return self.db
        
    def getArtefact(self, name):
        return self.artefactsDict.get(name)
        
    def getProperty(self, name):
        return self.propertiesDict.get(name)
        
    def addArtefact(self, name, url, version):
        artefact = DbArtefact(self, name, url, version)
        self.artefacts.append(artefact)
        self.artefactsDict[name] = artefact
        return artefact

    def addProperty(self, name, value):
        prop = DbProperty(self, name, value)
        self.properties.append(prop)
        self.propertiesDict[name] = prop
        return prop
    
    def getPropsString(self):
        result = ''
        propertiesIds = []
        for property in self.properties:
            propertiesIds.append(property.getId())
        propertiesStr = []
        for propertyId in sorted(propertiesIds):
            propertiesStr.append(str(propertyId))
        result = ','.join(propertiesStr)
        return result
    
    def getDepsString(self):
        result = ''
        artefactsIds = []
        for artefact in self.artefacts:
            artefactsIds.append(artefact.getId())
        artefactsIdsStr = []
        for artefactId in sorted(artefactsIds):
            artefactsIdsStr.append(str(artefactId))
        result = ','.join(artefactsIdsStr)
        return result
        
    def commit(self, dryrun=False):
        print ("Pipeline name: %s tag: %s id: %d" % (self.name, self.tag, self.getId()))
        for artefact in self.artefacts:
            artefact.commit(dryrun=dryrun)
        for prop in self.properties:
            prop.commit(dryrun=dryrun)

    def build(self, force):
        for artefact in self.artefacts:
            artefact.build(force)
                
"""
class PulpDb(object):
    
    def __init__(self):
        self.con = mdb.connect(os.environ['PULP_DB_ADDR'], 'pulpadmin', 'germ2214', 'pulp');
        self.pipelines = []

    def getPipelineFromId(self, id):
        rows = self.execCmd("SELECT * FROM pipelines WHERE id='%s';" % (id))
        if len(rows) == 0: return None
        else:
            pipe = DbPipeline(self, rows[0]['name'], rows[0]['tag'], id=id)
            for propId in rows[0]['properties'].split(','):
                prop = self.execCmd("SELECT * FROM properties WHERE id='%s';" % (propId))[0]
                pipe.addProperty(prop['name'], prop['value'])
            for artefactId in rows[0]['artefacts'].split(','):
                artefactDesc = self.execCmd("SELECT * FROM artefacts WHERE id='%s';" % (artefactId))[0]
                artefact = pipe.addArtefact(artefactDesc['name'], artefactDesc['url'], artefactDesc['tag'])
                if artefactDesc['dependencies'] != '':
                    for depId in artefactDesc['dependencies'].split(','):
                        depDesc = self.execCmd("SELECT * FROM artefacts WHERE id='%s';" % (depId))[0]
                        artefact.addDependency(depDesc['name'])
                if artefactDesc['properties'] != '':
                    for propId in artefactDesc['properties'].split(','):
                        propDesc = self.execCmd("SELECT * FROM properties WHERE id='%s';" % (propId))[0]
                        artefact.addDependency(propDesc['name'])
            return pipe 

    def addPipeline(self, name, tag):
        pipe = DbPipeline(self, name, tag)
        self.pipelines.append(pipe)
        return pipe   
    
    def execCmd(self, cmd):
        with self.con: 
            cur = self.con.cursor(mdb.cursors.DictCursor)
            cur.execute(cmd)
            return cur.fetchall()
    
    def commitArtefact(self, artefact):
        pass
        # First check if the artefact already exists
        #self.pipe.getDb().execCmd("SELECT * FROM artefacts(name,tag,properties,dependencies) VALUES('%s','%s','%s','%s');" % (artefact.getName(),artefacts.getTag(),artefacts)
        
            #self.pipe.getDb().execCmd("INSERT INTO artefacts(name,tag,modules,properties) VALUES('%s','%s','%s','%s');" % (args.name, args.tag, moduleList, propertyList)
        
    def commit(self, dryrun=False):
        for pipe in self.pipelines:
            pipe.commit(dryrun=dryrun)
        #with con: 
        #cur = con.cursor(mdb.cursors.DictCursor)

        #cmd = "INSERT INTO pipelines(name,tag,modules,properties) VALUES('%s','%s','%s','%s');" % (args.name, args.tag, moduleList, propertyList)
        
        
        #print (cmd)
    
        #cur.execute(cmd)
        pass
"""

class GetArtefact(object):
    def __init__(self, ci, group, artefact, branch, version, id, build, unpack=True, linkToDistrib=True):
        self.ci = ci
        self.group = group
        self.artefact = artefact
        self.branch = branch
        self.version = version
        self.build = build
        self.buildId = build
        self.unpack = unpack
        self.id = id

        if id != None:
            pulpDb = PulpDb()
            pipeline = pulpDb.getPipelineFromId(id=id)
            dbArtefact = pipeline.getArtefact(name=artefact)
            if build == 'LAST':
                [build, path] = self.ci.getLastBuild(group, artefact, branch, version, linkToDistrib=linkToDistrib)
                if build == None: raise NameError("Didn't find artefact at: " + str(path))
 
            self.path = ci.getPath(group, artefact, branch, version, build, linkToDistrib=linkToDistrib)
            return
        else:    
            if version == 'LAST':
                [version, path] = self.ci.getLastVersion(group, artefact, branch, linkToDistrib=linkToDistrib)
                if version == None: raise NameError("Didn't find artefact at: " + str(path))

            if build == 'LAST':
                [build, path] = self.ci.getLastBuild(group, artefact, branch, version, linkToDistrib=linkToDistrib)
                if build == None: raise NameError("Didn't find artefact at: " + str(path))
                self.buildId = build

            self.path = ci.getPath(group, artefact, branch, version, build, linkToDistrib=linkToDistrib)

    def get(self, dirPath):
        for p in self.path:
            outPath = os.path.join(dirPath, os.path.basename(str(p)))
            if not os.path.exists(os.path.dirname(outPath)):
                os.makedirs(os.path.dirname(outPath))
            out = open(outPath, 'wb')
            fd = p.open()
            out.write(fd.read())
            out.close()
            if self.unpack:
                # There is sometime a strange issue with NFS, wait a bit until the file is properly closed
                time.sleep(1)
                if outPath.find('manifest.ini') != -1: continue
                logging.debug("Unpacking file (path: %s)" % (outPath))
                t = tarfile.open(outPath, 'r')
                t.extractall(dirPath)
                os.remove(outPath)

    def close(self):
        pass

class Artefact(object):

    def __init__(self, ci, group, artefact, branch, version, build, pipe, linkToDistrib=True):
        self.ci = ci
        self.group = group
        self.artefact = artefact
        self.branch = branch
        self.version = version
        self.build = build
        self.buildId = build
        self.pipe = pipe

        print ("Creating new artefact for server: %s" % ci.server)

        if self.pipe != None:
            pulpDb = PulpDb()
            pipeline = pulpDb.getPipelineFromId(id=pipe)
            self.dbArtefact = pipeline.getArtefact(artefact)
            branch = None
            version = str(self.dbArtefact.getId())
        else:
            self.dbArtefact = None
    
        if version == 'LAST':
            [version, path] = self.ci.getLastVersion(group, artefact, branch, linkToDistrib=linkToDistrib)
            if version == None: version = "0"

        if build == 'LAST':
            [build, path] = self.ci.getLastBuild(group, artefact, branch, version, linkToDistrib=linkToDistrib)
            if build == None: build = "0"
            else: build = str(int(build) + 1)
            self.buildId = build

        # Increase the build number until we manage to lock
        # it in case several clients are trying to create the
        # same build at the same time
        while True:
            # The directory is first created with a lock inside so that no-one
            # tries to take it in an intermediate state.
            # It will get unlocked when it is closed by the producer
            self.lockPath = ci.getPath(group, artefact, branch, version, build, lock=True, linkToDistrib=linkToDistrib)
            try:
                self.lockPath.mkdir()
                break
            except:
                raise Exception("Didn't manage to create directory %s on the server: " % str(self.lockPath), sys.exc_info()[1])
                build = str(int(build) + 1)

        self.path = ci.getPath(group, artefact, branch, version, build, createDir=True, linkToDistrib=linkToDistrib)



    def regTestset(self, nbTests, nbTestsPassed):
        if nbTests == nbTestsPassed:
            status = 'PASSED'
        else:
            status = 'UNSTABLE'
        self.dbArtefact.regBuild(status=status, nbTests=nbTests, nbTestsPassed=nbTestsPassed)

    def deploy(self, fileName):
        print ("Deploying %s to %s" % (fileName, str(self.path)))

        self.path.deploy_file(fileName)
        if self.dbArtefact != None:
            self.dbArtefact.regBuild()


    def close(self):
        self.lockPath.rmdir()

class ArtefactSet(object):

    def __init__(self, ci, group, artefact, branch, version, build, pipe=None, files=None, linkToDistrib=True, id=None, unpack=True):
        self.artefactObj = None
        self.group = group
        self.ci = ci
        self.artefact = artefact
        self.branch = branch
        self.version = version
        self.build = build
        self.pipe = pipe
        self.linkToDistrib = linkToDistrib
        self.files = files
        self.id = id
        self.unpack = unpack

    def get(self, path):
        for server in self.ci.servers:
            try:
                print ("Trying to get artefact from this server: %s" % server.server)
                self.artefactObj = server.getArtefact(group=self.group, artefact=self.artefact, version=self.version, branch=self.branch, id=self.id, build=self.build, unpack=self.unpack, linkToDistrib=self.linkToDistrib)
                self.artefactObj.get(path)
                return
            except:
                print ("Failed to get artefact in this server (%s), skipping it: " % server.server, sys.exc_info()[1])

        raise Exception("Didn't manage to get artefact from any artifactory")

    def deploy(self):
        for server in self.ci.servers:
            try:
                self.artefactObj = server.newArtefact(group=self.group, artefact=self.artefact, branch=self.branch, version=self.version, build=self.build, pipe=self.pipe, linkToDistrib=self.linkToDistrib)
                for fileName in self.files:
                    self.artefactObj.deploy(fileName=fileName)
                return
            except:
                print ("Failed to deploy artefact in this server (%s), skipping it: " % server.server, sys.exc_info()[1])

        raise Exception("Didn't manage to deploy to any artifactory")

    def close(self):
        if self.artefactObj != None: self.artefactObj.close()

class ArtefactRepository(object):

    def __init__(self, server=None, distrib=None, verify=True):

        self.verify = verify

        if server == None:
            #server="http://larain.ee.ethz.ch:8081/artifactory/release"
            server="https://iis-artifactory.ee.ethz.ch/artifactory/release"
            #server="https://137.204.213.143:8081/artifactory/release"

        if distrib == None:
            dist = subprocess.Popen("lsb_release -a | grep Distributor | awk '{print $3}'", shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').strip()
            version = subprocess.Popen("lsb_release -a | grep Release | awk '{print $2}'", shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').strip().split('.')[0]

            distrib = "%s_%s" % (dist, version)
        
        self.distrib = distrib
        self.server = server
            

    def newArtefact(self, group, artefact, branch, version, build, pipe=None, linkToDistrib=True):
        return Artefact(self, group, artefact, branch, version, build, pipe=pipe, linkToDistrib=linkToDistrib)

    def getArtefact(self, group, artefact, version, branch, id, build, unpack, linkToDistrib=True):
        return GetArtefact(self, group, artefact, branch, version, id, build, unpack, linkToDistrib=linkToDistrib)

    def getLastVersion(self, group, artefact, branch, linkToDistrib=True):
        path = self.getPath(group, artefact, branch, createDir=True, linkToDistrib=linkToDistrib)
        version = 0
        subdirs = []
        for p in path:
            name = os.path.basename(str(p))
            subdirs.append(name)
        if len(subdirs) != 0:
            for p in subdirs:
                if p > version: version = p
            return [version, path]
        else:
            return [None, path]

    def getLastBuild(self, group, artefact, branch, version, linkToDistrib=True):
        path = self.getPath(group, artefact, branch, version, createDir=True, linkToDistrib=linkToDistrib)

        subdirs = []
        for p in path:
            name = os.path.basename(str(p))
            subdirs.append(name)

        build = "0"
        if len(subdirs) != 0:
            for p in subdirs:
                if p > build: build = p
            return [build, path]
        else:
            return [None, path]          


    def getPath(self, group=None, artefact=None, branch=None, version=None, build=None, createDir=False, lock=False, linkToDistrib=True):
        
        path = self.server
        if linkToDistrib: path = "%s/%s" % (path, self.distrib)
        if group != None:
            path = os.path.join(path, group)
        if artefact != None:
            path = os.path.join(path, artefact)
        if branch != None:
            path = os.path.join(path, branch)
        if version != None:
            path = os.path.join(path, version)
        if build != None:
            path = os.path.join(path, build)
        if lock:
            path = os.path.join(path, 'lock')

        if False:
#        if os.environ.get("PULP_OLD_ARTIFACTORY") != None:
            path = ArtifactoryPath(path + "/", auth=('admin', 'password'))
        else:

            passStr = os.environ.get("PULP_ARTIFACTORY_USER")
            if passStr == None:
                passStr = 'pulp:SFaMjrsckj3DRjjT7rKt'

            user, passwd = passStr.split(':')

            path = ArtifactoryPath(path + "/", auth=(user, passwd), verify=self.verify)

        #path = ArtifactoryPath(path + "/", auth=('admin', 'password'))
        #path = ArtifactoryPath(path + "/")
        if createDir:
            try:
                path.mkdir()
            except:
                pass

        return path


class ArtefactRepositorySet(object):

    def __init__(self, distrib=None):

        ethServer = ArtefactRepository(server="https://iis-artifactory.ee.ethz.ch/artifactory/release", distrib=distrib, verify=True)
        uniboServer = ArtefactRepository(server="https://artifactory.eees.dei.unibo.it:8081/artifactory/release", distrib=distrib, verify=False)

        if os.environ.get('PULP_ARTIFACTORY_SERVER') == 'unibo':
            servers = [uniboServer, ethServer]
        else:
            servers = [ethServer, uniboServer]
            #servers = [ethServer]

        self.servers = servers
        
    def getArtefact(self, group, artefact, version, branch, id, build, unpack, linkToDistrib=True):

        print ("Getting artefact (group: %s, artefact: %s, branch: %s, version: %s, id: %s, build: %s, unpack: %s, linkToDistrib: %s)" % (group, artefact, branch, version, id, build, unpack, linkToDistrib))

        if version == 'LAST': raise Exception ('Version LAST can not be used when using mirrored artifactories')
        if build == 'LAST': raise Exception ('Build LAST can not be used when using mirrored artifactories')

        return ArtefactSet(self, group, artefact, branch, version, build, id=id, unpack=unpack, linkToDistrib=linkToDistrib)

    def newArtefact(self, files, group, artefact, branch, version, build, pipe=None, linkToDistrib=True):

        print ("Creating new artefact (group: %s, artefact: %s, branch: %s, version: %s, build: %s, linkToDistrib: %s)" % (group, artefact, branch, version, build, linkToDistrib))

        if version == 'LAST': raise Exception ('Version LAST can not be used when using mirrored artifactories')
        if build == 'LAST': raise Exception ('Build LAST can not be used when using mirrored artifactories')

        return ArtefactSet(self, group, artefact, branch, version, build, files=files, pipe=pipe, linkToDistrib=linkToDistrib)
