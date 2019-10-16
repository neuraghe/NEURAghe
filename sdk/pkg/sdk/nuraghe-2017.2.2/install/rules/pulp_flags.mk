PULP_FLAGS_OPT := 

ifdef PULP_CONFIGS
systemConfig = $(PULP_CONFIGS)
endif

ifdef config
systemConfig = $(config)
endif

ifdef pulpNoFc
PULP_FLAGS_OPT += --pulpNoFc
endif

ifdef pulpFc
PULP_FLAGS_OPT += --pulpFc
endif

ifdef gtkw
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --gtkw
endif

ifdef platform
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --platform=$(platform)
endif

ifneq '$(PULP_APP_OMP_SRCS)' ''
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --omp
endif

ifdef rtTrace
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --rt-trace=$(rtTrace)
endif

ifdef compatMode
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --compat-mode
endif

ifdef rtNowarning
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --rt-no-warning
endif

ifdef pulpDiv
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpDiv
endif

ifdef pulpFpu
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpFpu
endif

ifdef pulpLnu
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpLnu
endif

ifdef pulpSharedFpu
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpSharedFpu=$(pulpSharedFpu)
endif

ifdef pulpRtVersion
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpRtVersion=$(pulpRtVersion)
endif

ifdef noCrt0
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --no-crt0
endif

ifdef noRt
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --no-rt
endif

ifdef noLinkScript
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --no-link-script
endif

ifdef pulpCompiler
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpCompiler=$(pulpCompiler)
endif

ifdef hostCompiler
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --hostCompiler=$(hostCompiler)
endif

ifdef load
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --load=$(load)
endif

ifdef io
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --io=$(io)
endif

ifdef compilerRt
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --compiler-rt
endif

ifdef gui
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --gui
endif

ifdef vsimCov
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --vsimCov
endif

ifdef vsimTestName
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --vsim-testname=$(vsimTestName)
endif

ifdef recordWlf
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --recordWlf
endif

ifdef vsimDo
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --vsim-do=$(vsimDo)
endif

ifdef vsimScript
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --vsim-script=$(vsimScript)
endif

ifdef coreTrace
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --coreTrace
endif

ifdef NO_LINK_SCRIPT
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --no-link-script
endif

ifdef pulpCoreArchi
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpCoreArchi=$(pulpCoreArchi)
endif

ifdef pulpCore
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpCore=$(pulpCore)
endif

ifdef pulpChip
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpChip=$(pulpChip)
endif

ifdef pulpChipVersion
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpChipVersion=$(pulpChipVersion)
endif

ifdef pulpRt
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpRt=$(pulpRt)
endif

ifdef pulpOmpVersion
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpOmpVersion=$(pulpOmpVersion)
endif

ifdef l2Size
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --l2Size=$(l2Size)
endif

ifdef romSize
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --romSize=$(romSize)
endif

ifdef l1Size
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --l1Size=$(l1Size)
endif

ifdef scmSize
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --scmSize=$(scmSize)
endif

ifdef nbPe
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --nbPe=$(nbPe)
endif

ifdef stackSize
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --stackSize=$(stackSize)
endif

ifdef nbCluster
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --nbCluster=$(nbCluster)
endif

PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --buildDir=$(BUILD_DIR)

ifdef fetchAll
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --fetch-all
endif

ifdef buildDirExt
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --buildDirExt=$(buildDirExt)
endif

ifdef systemConfig
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --systemConfig="$(systemConfig)"
endif

ifdef PULP_APP_WHOLE_DEPS
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --wholeDeps
endif

ifdef PULP_LIB_PATHS
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) $(foreach lib,$(PULP_LIB_PATHS), --pulp-lib-path=$(lib)) 
endif

PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) $(foreach dep,$(PULP_APP_DEPS), --pulp-lib=$(dep))
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) $(foreach dep,$(PULP_APP_WHOLE_DEPS), --pulp-full-lib=$(dep)) 

ifdef PULP_APP
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpBinary=$(PULP_APP)
endif

ifdef PULP_OMP_APP
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --pulpBinary=$(PULP_OMP_APP)
endif

ifdef gdbsim
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --gdbsim
endif

ifdef or1ksim
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --or1ksim
endif

ifdef gvsim
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --gvsim
endif

ifdef or1kfsim
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --or1kfsim
endif

ifdef useChip
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --use-chip
endif

ifdef APP_BUILD_DIR
PULP_FLAGS_OPT := $(PULP_FLAGS_OPT) --appBuildDir=$(APP_BUILD_DIR)
endif
