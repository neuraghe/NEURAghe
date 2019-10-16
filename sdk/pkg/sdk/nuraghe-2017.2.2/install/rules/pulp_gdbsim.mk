include $(PULP_SDK_HOME)/install/rules/pulp_defs.mk

clean:
	rm -f $(APP)

all:
	$(PULP_CC) $(PULP_CFLAGS) $(PULP_APP_SRCS) $(PULP_APP_OMP_SRCS) -o $(PULP_APP)

run:
	or1kle-elf-run $(PULP_APP)
