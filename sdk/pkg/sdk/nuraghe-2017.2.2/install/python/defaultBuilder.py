import os
import threading
import queue
import subprocess
import pulpconfig

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

constraints = []
#"config.get('pulpCoreArchi').find('riscv') == -1 or config.get('pulpCompiler') == 'gcc'",
#               "config.get('pulpCoreArchi') == 'or10n' or config.get('pulpArchi') != 'pulp4z'"]

# Get a dictionary with a list of possible values for each key
# Iterate on all possible combination
# Returns a list with each possile combination 
# Each combinartion is a dictionary with the same keys
# and the corresponding chosen value
def getConfigs(items):

    if len(items) == 0: return [{}]

    configs = []
    dictItems = list(items.items())
    key, values = dictItems.pop(0)

    for value in values:

        subConfigs = getConfigs(dict(dictItems))

        for subConfig in subConfigs:
            config = subConfig.copy()
            config[key] = value
            configs.append(config)

    return configs

def execCmd(cmd, cwd=None, env=None, log=None, stdout=True):
    if cwd == None: cwd = os.getcwd()
    desc = subprocess.DEVNULL
    if stdout:
        desc = None
    elif log != None:
        desc = log

    if env != None and env.get('flag') != None:
        for flag in env.get('flag'):
            key,value = flag.split('=')
            env[key] = value
        del env['flag']

    p = subprocess.Popen(cmd, cwd=cwd, env=env, shell=True, stdout=desc, stderr=subprocess.STDOUT, executable='/bin/bash')
    p.wait()
    return p.returncode
    

class Cmd(object):

    def __init__(self, cmd, configDict, config, folder, log=None, stdout=None, appendFolder=False):
        self.cmd = cmd
        self.config = configDict
        self.folder = folder
        self.config2 = config
        self.log = log
        self.stdout = stdout
        self.appendFolder = appendFolder

    def execCmd(self):
        print ('  Starting config ' + self.config2.getString())

        env = os.environ.copy()
        env.update(self.config2.getSpecConfigItems())

        dir = os.path.join(os.getcwd(), self.folder)

        if self.appendFolder: env['BUILD_DIR'] = env['BUILD_DIR'] + '/' + self.folder

        res = execCmd(self.cmd, dir, env, self.log, self.stdout)

        if res != 0:
            print (bcolors.FAIL + '  Failed config ' + self.config2.getString() + bcolors.ENDC)
        else:
            print ('  Finished config ' + self.config2.getString())

        return res


class ResultThread(threading.Thread):

    def __init__(self, resultQueue, retvalQueue, nbWorkers):
        threading.Thread.__init__(self)
        self.resultQueue = resultQueue
        self.retvalQueue = retvalQueue
        self.nbWorkers = nbWorkers
        self.nbFinishedWorkers = 0

    def run(self):
        res = False
        while True:
            data = self.resultQueue.get(block=True)
            if data == None:
                self.nbFinishedWorkers += 1
                if self.nbFinishedWorkers == self.nbWorkers: break
                continue
            res = res or data

        self.retvalQueue.put(res, block=True)
        

class BuildWorker (threading.Thread):
    
    def __init__(self, queue, resultQueue):
        threading.Thread.__init__(self)
        self.queue = queue
        self.resultQueue = resultQueue

    def run(self):
        while True:
            data = self.queue.get()
            if data == None: 
                self.resultQueue.put(None, block=True)
                return
            res = data.execCmd()
            self.resultQueue.put(res, block=True)

class Builder(object):

    def __init__(self, args, nbWorkers, log=None, stdout=False):
        self.args = args
        self.queue = queue.Queue()
        self.resultQueue = queue.Queue()
        self.retvalQueue = queue.Queue()
        self.nbWorkers = nbWorkers
        self.log = log
        self.stdout = stdout

    def execCmd(self, nbWorkers, cmdName, cmd, configs, modConstraints, folders, parameters):

        appendFolder = True

        if nbWorkers == None: nbWorkers = self.nbWorkers

        if folders == None: 
            folders = [os.getcwd()]
            appendFolder = False

        if cmdName == 'custom' or cmdName == 'checkout':
            return execCmd(cmd)

        if cmdName == 'header':
            res = False
            for folder in folders:
                res = res or execCmd(cmd, folder, log=self.log, stdout=self.stdout)
            return res
        else:
            self.workers = []
            for i in range(0, nbWorkers):
                worker = BuildWorker(self.queue, self.resultQueue)
                self.workers.append(worker)
                worker.start()
            ResultThread(self.resultQueue, self.retvalQueue, nbWorkers).start()

            for folder in folders:

                configsDone = []

                for configDict in configs:  
                    config = pulpconfig.getConfig(**configDict)

                    skip = False
                    for constraint in constraints + modConstraints:
                        if not eval(constraint): 
                            skip = True
                            break
                    if skip: continue  

                    if parameters == None:
                        parameters = ''

                    if parameters != None:
                        realConfig = {}
                        for param in parameters:
                            realConfig[param] = config.get(param)
                        realConfigStr = []
                        for key in sorted(realConfig.keys()):
                            realConfigStr.append('%s=%s' % (key, realConfig.get(key)))
                        realConfigStr = '_'.join(realConfigStr)
                        
                        if realConfigStr in configsDone: continue
                        configsDone.append(realConfigStr)

                    build = Cmd(cmd, config.getAll(), config, folder, stdout=self.stdout, log=self.log, appendFolder=appendFolder)
                    self.queue.put(build)

            for i in range(0, nbWorkers):
                self.queue.put(None, block=True)

            for i in range(0, nbWorkers):
                worker = self.workers.pop()
                worker.join()

            return self.retvalQueue.get()

            
