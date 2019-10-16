TEST?=tests/hello_world
BUILD_DIR:= build/$(TEST)

include definitions.mk
include dependencies.mk

TESTCSRC:= $(wildcard $(TEST)/src/*.c)
TESTCPPSRC:= $(wildcard $(TEST)/src/*.cpp)
COBJ:= $(patsubst $(TEST)/src/%.c,$(OBJ)/%.o,$(TESTCSRC))
CPPOBJ:= $(patsubst $(TEST)/src/%.cpp,$(OBJ)/%.o,$(TESTCPPSRC))


all: libneuconvnet main

libneuconvnet:
	cd $(ROOT) && $(MAKE) clean && $(MAKE) -j16 all

$(OBJ)/%.o: %.c
	mkdir -p $(OBJ)
	$(CC) -c $(CFLAGS) $(RELEASE_FLAGS) $(SAN_FLAGS) $(DEBUG_FLAGS) $(PROF_FLAGS) $(MODFLAGS) $(TYPE_FLAGS) $(ACC_FLAGS) $(INC) $< -o $@

$(OBJ)/%.o: %.cpp
	mkdir -p $(OBJ)
	$(CPP) -c $(CPPFLAGS) $(RELEASE_FLAGS) $(SAN_FLAGS) $(DEBUG_FLAGS) $(PROF_FLAGS) $(MODFLAGS) $(TYPE_FLAGS) $(ACC_FLAGS) $(INC) $< -o $@

main: $(COBJ) $(CPPOBJ)
	mkdir -p $(BUILD_DIR)
	$(info setup test: ${TEST} )	
	$(CP) -r ${TEST}/* ${BUILD_DIR}
	$(CPP) $(PROF_FLAGS) $(COBJ) $(CPPOBJ) $(LOAD) -Wl,-Bstatic $(MAIN_LA) -Wl,-Bdynamic $(MAIN_LSO) -o $(BUILD_DIR)/$@

run:
	cd ${BUILD_DIR} && ./run-test.sh

clean_pt:
	rm -rf ./tests/conv_test/weights/weights_array_file_hw* ./tests/conv_test/weights/wb.h 

pt:
	cd ./tests/conv_test/ && python binfile.py settings_1.9.txt && $(PT_PATH)/post_training.py settings_1.9.txt
	
pt_tcn:
	cd ./tests/conv_test/ && python binfile.py settings_2.0.txt && $(PT_PATH)/post_training_tcn.py settings_2.0.txt

comp_mw:
	cd $(MW) && $(MAKE) clean all l2size=2097152 stackSize=8192 nbPe=1 scmSize=1024 l1Size=31744 code


load: load-main
ifndef NEURAGHE_BOARD_ADDR
$(error NEURAGHE_BOARD_ADDR is not set)
endif
ifndef NEURAGHE_INSTALL_DIR
$(error NEURAGHE_INSTALL_DIR is not set)
endif
	$(info setup test: ${TEST} )
	$(CP) -r ${TEST}/* ${BUILD_DIR}
	$(CP) -r zynq ${BUILD_DIR}
	ssh $(NEURAGHE_BOARD_ADDR) 'mkdir -p $(NEURAGHE_INSTALL_DIR)'
	rsync -rctacvzP --delete-after ${BUILD_DIR}/* $(NEURAGHE_BOARD_ADDR):~/$(NEURAGHE_INSTALL_DIR)
	xmessage -default okay -center - "load complete."

download:
ifndef NEURAGHE_BOARD_ADDR
$(error NEURAGHE_BOARD_ADDR is not set)
endif
ifndef NEURAGHE_INSTALL_DIR
$(error NEURAGHE_INSTALL_DIR is not set)
endif
	rsync -rctacvzP --delete-after $(NEURAGHE_BOARD_ADDR):~/$(NEURAGHE_INSTALL_DIR)/* ${BUILD_DIR}

load-main:
ifndef NEURAGHE_BOARD_ADDR
$(error NEURAGHE_BOARD_ADDR is not set)
endif
ifndef NEURAGHE_INSTALL_DIR
$(error NEURAGHE_INSTALL_DIR is not set)
endif
	$(info setup test: ${TEST} )
	$(CP) -r ${TEST}/* ${BUILD_DIR}
	$(CP) -r zynq ${BUILD_DIR}
	ssh $(NEURAGHE_BOARD_ADDR) 'mkdir -p $(NEURAGHE_INSTALL_DIR)'
	rsync -rctacvzP --delete-after ${BUILD_DIR}/main $(NEURAGHE_BOARD_ADDR):~/$(NEURAGHE_INSTALL_DIR)

clean:
	$(RM) $(COBJ) $(CPPOBJ)
	$(RM) $(OBJ_DIR)
	$(RM) $(BUILD_DIR)
