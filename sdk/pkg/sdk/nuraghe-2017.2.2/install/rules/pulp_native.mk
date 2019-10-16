PULP_CFLAGS += -DNATIVE -m32
PULP_LDFLAGS += -m32

ifdef PULP_OMP_APP
APP = $(PULP_OMP_APP)
else
APP = $(PULP_APP)
endif

clean:
	rm -rf $(BUILD_DIR)/$(APP)

all:
	mkdir -p $(BUILD_DIR)
	gcc $(PULP_APP_SRCS) $(PULP_APP_OMP_SRCS) -fopenmp $(PULP_OMP_CFLAGS) $(PULP_CFLAGS) $(PULP_APP_SRCS) -o $(BUILD_DIR)/$(APP) $(PULP_LDFLAGS)

run:
	$(BUILD_DIR)/$(APP)
