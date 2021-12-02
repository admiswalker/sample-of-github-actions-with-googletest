# Source files
SRCS = ./main.cpp

# Name of generate file: 生成ファイル名
TARGET = exe

# remove files
RMs  = *.stackdump tmpDir

# Options: コンパイルオプション
CFLAGS  = -L./googletest-master/build/lib -I./googletest-master/googletest/include -lgtest -pthread # google test
CFLAGS += -std=c++11 # CFLAGS += -std=gnu++0x
CFLAGS += -Wall
CFLAGS += -O3


# when you need to check the change of files in lib, you need to change file name to a not-existing name like "FORCE_XXX".
#LIB_GOOGLETEST = FORCE_GOOGLETEST
LIB_GOOGLETEST = ./googletest-master/build/lib/libgtest.a


$(TARGET): $(LIB_GOOGLETEST) $(SRCS)
	@echo "\n============================================================\n"
	@echo "SRCS: \n$(SRCS)\n"
	@echo "CFLAGS: \n$(CFLAGS)"
	@echo "\n============================================================\n"
	$(CXX) -o $(TARGET) $(SRCS) $(CFLAGS)
	@echo ""


$(LIB_GOOGLETEST):
	@echo ""
	@unzip -n googletest-master.zip
	@(cd ./googletest-master; mkdir -p build; cd build; cmake ..; make)


.PHONY: all
all:
	@(make clean)
	@(make -j)


patch            := *.stackdump
patch_txt_exists := $(shell find -name $(patch))
.PHONY: clean
clean:
	-rm -rf $(TARGET)
	-rm -rf googletest-master
	@(find . -name "__pycache__" -type d | xargs rm -rf)
	-rm -rf $(RMs)


.PHONY: steps
steps: $(SRCS) $(HEADS_t)
	@(cd ./sstd; make steps)
	@echo ""
	@echo "$^" | xargs wc -l

