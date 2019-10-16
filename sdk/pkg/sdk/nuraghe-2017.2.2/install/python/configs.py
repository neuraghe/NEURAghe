#!/usr/bin/env python3


class ArgConfig:

    def __init__(self, config):
        self.configItems = {}
        for item in config.split('_'):
            if item.find('=') == -1:
                raise BaseException("Invalid config item '%s' in config '%s'" % (item, config))
            [name,value] = item.split('=', 1)
            self.configItems[name] = value
        

    def getName(self):
        names = []
        for name in sorted(self.configItems.keys()):
            names.append('%s=%s' % (name,self.configItems.get(name)))
        return '_'.join(names)

    def restrict(self, name, value):
        if self.configItems.get(name) == None:
            self.configItems[name] = value
            return True
        else:
            return self.configItems.get(name) == value
        
    def duplicate(self, config):
      allMatch = True
      for item in config.split('_'):
        if item.find('=') == -1:
          raise BaseException("Invalid item '%s'" % (item))
        [name,value] = item.split('=', 1)        
        if self.configItems.get(name) != value: allMatch = False

      if allMatch: return None
      dup = ArgConfig(self.getName())
      for item in config.split('_'):
        [name,value] = item.split('=', 1)   
        dup.configItems[name] = value
      return dup

    def exclude(self, name, value):
      return self.configItems.get(name) == value

    def applyConstraint(self, constraintName, constraintValue, config):
      if self.configItems.get(constraintName) != None:
        if constraintValue == None or self.configItems.get(constraintName) == constraintValue:
          
          for item in config.split('_'):
            if item.find('=') == -1:
              raise BaseException("Invalid item '%s'" % (item))
            [itemName,itemValue] = item.split('=', 1)


            if self.configItems.get(itemName) != None and self.configItems.get(itemName) != itemValue:
              return True


      return False

    def applyConstraintEval(self, constraint):
      return not eval(constraint)

class ArgConfigs:

    def __init__(self, configsNames=[]):
        self.configs = []
        self.configsDict = {}
        for configName in configsNames:
          if self.configsDict.get(configName) == None:
            config = ArgConfig(configName)
            self.configs.append(config)
            self.configsDict[config.getName()] = config
            
    def getNames(self):
        names = []
        for config in self.configs:
            names.append(config.getName())
        return names

    def restrictItem(self, item):
        if item.find('=') == -1:
            raise BaseException("Invalid item '%s'" % (item))
        [name,value] = item.split('=', 1)
        for config in self.configs:

            self.configs = [config for config in self.configs if config.restrict(name, value)]

        self.configsDict = {}
        for config in self.configs:
          self.configsDict[config.getName()] = config


    def restrict(self, configs):
        for config in configs:
            for item in config.split('_'):
                self.restrictItem(item)
        
    def duplicate(self, items):
      for item in items:
        for config in self.configs:
          dup = config.duplicate(item)
          if dup != None and self.configsDict.get(dup.getName()) == None:
            self.configs.append(dup)
            self.configsDict[dup.getName()] = dup

        
    def exclude(self, items):
      for item in items:
        if item.find('=') == -1:
          raise BaseException("Invalid item '%s'" % (item))
        [name,value] = item.split('=', 1)

        removeConfigs = []
        for config in self.configs:
          if config.exclude(name, value):
            removeConfigs.append(config)

        for config in removeConfigs:
            self.remove(config)

    def remove(self, config):
      if config in self.configs:
        self.configs.remove(config)
        del self.configsDict[config.getName()]

    def applyConstraints(self, constraints):
      removeConfigs = []
      for constraint,value in constraints.items():       

        if constraint.find('=') != -1:
          [constraintName, constraintValue] = constraint.split('=')
        else:
          constraintName = constraint
          constraintValue = None
      
        for config in self.configs:
          if config.applyConstraint(constraintName, constraintValue, value):
            removeConfigs.append(config)

      for config in removeConfigs:
        self.remove(config)
        
    def applyConstraintsEval(self, constraints):
      removeConfigs = []
      for constraint in constraints:       

        for config in self.configs:
          if config.applyConstraintEval(constraint):
            removeConfigs.append(config)

      for config in removeConfigs:
        self.remove(config)
        
class Configs(object):

    def __init__(self):
        pass

    def parseOptions(self, parser):

        parser.add_argument("--llvm", dest="llvm", action="store_true", default=False, help="Duplicate configs for LLVM compiler")

        parser.add_argument("--gcc", dest="gcc", action="store_true", default=False, help="Duplicate configs for GCC compiler")

        parser.add_argument("--gvsoc", dest="gvsoc", action="store_true", default=False, help="Duplicate configs for GVSOC platform")

        parser.add_argument("--rtl", dest="rtl", action="store_true", default=False, help="Duplicate configs for RTL platform")

        parser.add_argument("--fpga", dest="fpga", action="store_true", default=False, help="Duplicate configs for FPGA platform")

        parser.add_argument("--omp", dest="omp", action="store_true", default=False, help="Duplicate configs for OMP runtime")

        parser.add_argument("--bare", dest="bare", action="store_true", default=False, help="Duplicate configs for BARE runtime")

        parser.add_argument("--mia", dest="mia", action="store_true", default=False, help="Duplicate configs for MIA archi")

        parser.add_argument("--pulp4", dest="pulp4", action="store_true", default=False, help="Duplicate configs for PULP4 archi")

        parser.add_argument("--pulpevo", dest="pulpevo", action="store_true", default=False, help="Duplicate configs for PULPEVO archi")

        parser.add_argument("--riscv", dest="riscv", action="store_true", default=False, help="Duplicate configs for RISCV core")

        parser.add_argument("--riscv-rvc", dest="riscvRvc", action="store_true", default=False, help="Duplicate configs for RISCV-RVC core")

        parser.add_argument("--ri5cy", dest="ri5cy", action="store_true", default=False, help="Duplicate configs for RI5CY core")

        parser.add_argument("--ri5cy-rvc", dest="ri5cyRvc", action="store_true", default=False, help="Duplicate configs for RI5CY-RVC core")

        parser.add_argument("--ri5cyv2", dest="ri5cyv2", action="store_true", default=False, help="Duplicate configs for RI5CYV2 core")

        parser.add_argument("--ri5cyv2-rvc", dest="ri5cyv2Rvc", action="store_true", default=False, help="Duplicate configs for RI5CYV2-RVC core")

        parser.add_argument("--or1k", dest="or1k", action="store_true", default=False, help="Duplicate configs for OR1K core")

        parser.add_argument("--or10n", dest="or10n", action="store_true", default=False, help="Duplicate configs for OR10N core")

        parser.add_argument("--or10nv2", dest="or10nv2", action="store_true", default=False, help="Duplicate configs for OR10NV2 core")

        parser.add_argument("--config", dest="configs", action="append", default=[], help="Add a config on which to launch the testset")

        parser.add_argument("--config-duplicate", dest="configDuplicate", default=[], action="append", metavar="CONFIG", help="Add a config to default ones")

        parser.add_argument("--config-exclude", dest="configExclude", default=[], action="append", metavar="CONFIG", help="Add a config to default ones")


        args = parser.parse_known_args()[0]
        self.args = args



    def itemConf(self, item, active, configGiven):
        if active:
            self.args.configDuplicate.append(item)
        elif not configGiven:
            self.args.configExclude.append(item)



    def getConfigs(self):
        configsNames = []

        for config in self.args.configs:
            itemList = []
            for configItem in config.split(':'):
                itemList.append(configItem)
            configsNames.append('_'.join(itemList))

        configGiven = len(configsNames) != 0

        if len(configsNames) == 0:
            # No config was specified, set default values
            if not (self.args.llvm or self.args.gcc): self.args.gcc = True
            if not (self.args.pulp4 or self.args.mia or self.args.pulpevo): self.args.pulp4 = True
            if not (self.args.gvsoc or self.args.rtl or self.args.fpga): self.args.gvsoc = True
            if not (self.args.ri5cy or self.args.ri5cyRvc or self.args.ri5cyv2 or self.args.ri5cyv2Rvc or self.args.riscv or self.args.riscvRvc or self.args.or10n or self.args.or10nv2 or self.args.or1k): self.args.or10n = True
            if not (self.args.omp or self.args.bare): self.args.bare = True

            if self.args.omp:
                configsNames.append("soc=pulp_pulpArchi=pulp4_platform=gvsoc_pulpCompiler=gcc_pulpRt=omp_pulpOmpRuntime=libgomp_pulpCoreArchi=or10n")
            if self.args.bare:
                configsNames.append("soc=pulp_pulpArchi=pulp4_platform=gvsoc_pulpCompiler=gcc_pulpRt=bare_pulpCoreArchi=or10n")

            
        # Apply options
        self.itemConf('pulpCompiler=llvm', self.args.llvm, configGiven)
        self.itemConf('pulpCompiler=gcc', self.args.gcc, configGiven)

        self.itemConf('pulpArchi=pulp4', self.args.pulp4, configGiven)
        self.itemConf('pulpArchi=pulpevo', self.args.pulpevo, configGiven)
        self.itemConf('pulpArchi=mia', self.args.mia, configGiven)

        self.itemConf('pulpCoreArchi=ri5cyv2', self.args.ri5cyv2, configGiven)
        self.itemConf('pulpCoreArchi=ri5cyv2-rvc', self.args.ri5cyv2Rvc, configGiven)
        self.itemConf('pulpCoreArchi=ri5cy', self.args.ri5cy, configGiven)
        self.itemConf('pulpCoreArchi=ri5cy-rvc', self.args.ri5cyRvc, configGiven)
        self.itemConf('pulpCoreArchi=riscv', self.args.riscv, configGiven)
        self.itemConf('pulpCoreArchi=riscv-rvc', self.args.riscvRvc, configGiven)
        self.itemConf('pulpCoreArchi=or1k', self.args.or1k, configGiven)
        self.itemConf('pulpCoreArchi=or10n', self.args.or10n, configGiven)
        self.itemConf('pulpCoreArchi=or10nv2', self.args.or10nv2, configGiven)

        self.itemConf('platform=gvsoc', self.args.gvsoc, configGiven)
        self.itemConf('platform=rtl', self.args.rtl, configGiven)
        self.itemConf('platform=fpga', self.args.fpga, configGiven)

        self.itemConf('pulpRt=bare', self.args.bare, configGiven)
        self.itemConf('pulpRt=omp_pulpOmpVersion=libgomp', self.args.omp, configGiven)
        
        configs = ArgConfigs(configsNames)

        configs.duplicate(self.args.configDuplicate)

        configs.exclude(self.args.configExclude)

        return configs.getNames()
