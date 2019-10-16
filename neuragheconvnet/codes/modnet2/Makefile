
include definitions.mk
include dependencies.mk

all: neuconvnet

clean:
	$(RM) $(OBJ_DIR)

clean-all:
	$(RM) $(OBJ_DIR)
	$(RM) $(LIB_DIR)

$(OBJ)/%.o: %.c
	mkdir -p obj
	$(CC) -c $(CFLAGS) $(RELEASE_FLAGS) $(SAN_FLAGS) $(DEBUG_FLAGS) $(PROF_FLAGS) $(MODFLAGS) $(DEPFLAGS) $(TYPE_FLAGS) $(ACC_FLAGS) $(INC) $< -o $@

$(OBJ)/%.o: %.cpp
	mkdir -p obj
	$(CPP) -c $(CPPFLAGS) $(RELEASE_FLAGS) $(SAN_FLAGS) $(DEBUG_FLAGS) $(PROF_FLAGS) $(MODFLAGS) $(DEPFLAGS) $(TYPE_FLAGS) $(ACC_FLAGS) $(INC) $< -o $@

neuconvnet: $(MAIN_O)
	mkdir -p $(LIB)
	$(AR) $(LIB)/lib$@-$(ARCH)$(TYPE)$(VERSION).a $(MAIN_O)
