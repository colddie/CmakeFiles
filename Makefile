
# core compiling options
CXX = g++

CXX_STD = -std=c++11
OPT_FLAGS = -Wall -O3 -march=native -ffp-contract=fast -DARMA_NO_DEBUG

ARMA_INCLUDE_PATH = /home/tsun/bin/armadillo-9.400.4/install/include
TPC_INCLUDE_PATH = /home/tsun/bin/tpcclib-master/build/lib/include
OPTIM_HEADER_DIR = /home/tsun/bin/optim-master/install/include/optim
LOCAL_HEADER_DIR = /home/tsun/bin/optim-master/tests/examples/include
#/home/tsun/bin/optim-master/header_only_version 

# install location
INSTALL_PATH= .

# source directories
OPTIM_TEST_DIR = .

# general flags
LDFLAGS = -shared
CXXFLAGS = -fPIC -fopenmp $(CXX_STD) $(OPT_FLAGS) -I$(LOCAL_HEADER_DIR) -I$(ARMA_INCLUDE_PATH) -I$(OPTIM_HEADER_DIR) -I$(TPC_INCLUDE_PATH) -I$(OPTIM_HEADER_DIR) 
LIBS= -L/home/tsun/bin/tpcclib-master/build/lib  /home/tsun/bin/armadillo-9.400.4/install/lib64/libarmadillo.so \
/home/tsun/bin/optim-master/install/lib/liboptim.so \
/cm/shared/apps/openblas/0.2.20/lib/libopenblas.so 


SRC = $(wildcard *.cxx)
OBJ = $(src:.cxx=.o)

TARGET = testOptim

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o  $@ $^ $(SRC) $(LIBS) 

# SRC = testOptim.cxx 
# Optim Test Files
# SOURCES_OPTIM := rwmh_tac.cpp  # $(shell find $(OPTIM_TEST_DIR) -name '*.cpp')


# OBJECTS_OPTIM = tgo.o powell.o bobyqa.o gaussdev.o #testOptim.o #$(addprefix $(OPTIM_TEST_DIR)/,$(SOURCES_OPTIM:%.cpp=%.test))

# powell.o: tgo.h powell.cxx
# 	$(CXX) powell.cxx tgo.h -c
# bobyqa.o: tgo.h bobyqa.cxx
# 	$(CXX) bobyqa.cxx tgo.h -c
# gaussdev.o: tgo.h gaussdev.cxx
# 	$(CXX) gaussdev.cxx tgo.h -c
# tgo.o: tgo.cxx tgo.h 
# 	$(CXX) tgo.cxx tgo.h powell.o bobyqa.o gaussdev.o -c
# testOptim.o: testOptim.cxx
# 	$(CXX) $(CXXFLAGS) tgo.o powell.o bobyqa.o gaussdev.o testOptim.cxx -c

# all:  $(TARGET) 
#lib$(TARGET).so lib$(TARGET).a   

# core Optim files
# $(OPTIM_TEST_DIR)/%.test: $(OPTIM_TEST_DIR)/%.cpp 
# 	$(CXX) $(CXXFLAGS) $< -o $@ $(LIBS)

# # models in a library                 
# lib$(TARGET).a : ${OBJECTS_OPTIM}
# 	${AR} -r $@ ${OBJECTS_OPTIM}

# lib$(TARGET).so : ${OBJECTS_OPTIM}
# 	$(CXX) $(CXXFLAGS) ${LDFLAGS} -o lib$(TARGET).so ${OBJECTS_OPTIM} $(LIBS)   
# 	## -o $@ ${OBJECTS_OPTIM}

# $(TARGET): ${OBJECTS_OPTIM}
# 	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC) ${OBJECTS_OPTIM} $(LIBS) 


# cleanup and install
.PHONY: clean
clean:
	@rm -rf *.so ./*.gcov ./*.gcno ./*.gcda ./*.dSYM ./*.test ./*.o ./*.a

