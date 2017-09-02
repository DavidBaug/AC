###############################################################################
# makefile
###############################################################################

SHELL = bash
.ONESHELL:

###############################################################################

SRC = $(wildcard *.c *.cc *.cpp)
EXE = $(basename $(SRC))
ATT = $(EXE:=.att)

CFLAGS   = -fopenmp -march=native -O3 -Wall
CXXFLAGS = $(CFLAGS) -std=c++11
LDFLAGS  = -lrt

MPICC  = $(shell locate mpicc  | grep '/bin/mpicc$$')
MPICXX = $(shell locate mpic++ | grep '/bin/mpic++$$')
MPIRUN = $(shell locate mpirun | grep '/bin/mpirun$$')

###############################################################################

default: $(EXE)

all: stat

clean:
	$(RM) -fv $(ATT) $(EXE) core.* perf.* *~

perf:
	@echo "perf record --call-graph dwarf ./app"; \
	echo "perf report -g --no-children"

stat: $(sort $(filter pi% opi% mpi-pi%,$(EXE)))
	@for i in $^; do \
		echo -en "$$i      \t"; \
		if echo $$i | grep -q mpi; then \
			perf stat -- $(MPIRUN) -n 4 ./$$i 99999999 |& grep elapsed; \
		else \
			perf stat --                ./$$i 99999999 |& grep elapsed; \
		fi | tr -s ' '; \
	done

tabla1: schedule-clause++ scheduled-clause++ scheduleg-clause++
	@export OMP_NUM_THREADS=2
	echo '     static  dynamic   guided'
	echo '--- -------  -------  -------'
	echo ' i: 1  2  4  1  2  4  1  2  4'
	echo '--- -------  -------  -------'
	for (( i = 0; i < 16; ++i )); do
		echo -en "`seq -w $$i 17 16 | tr -d '\n'`: "
		for s in $^; do
			for c in 1 2 4; do
				if [ "$$s" == "schedule-clause++" ]; then
					id=`./$$s $$c 2> /dev/null`
				else
					id=`./$$s 16 $$c 2> /dev/null`
				fi
				id=`echo -e $$id | grep -m 1 "a\[$$i\] = [[:digit:]]*"`
				if [ -n "$$id" ]; then 
					id=$${id:7:1}; 
				else
					id='x';
				fi
				echo "$$id."
			done | tr '[[:space:]].' ' '
		done
		echo
	done

tabla2: schedule-clause++ scheduled-clause++ scheduleg-clause++
	@export OMP_NUM_THREADS=4
	echo '     static  dynamic   guided'
	echo '--- -------  -------  -------'
	echo ' i: 1  2  4  1  2  4  1  2  4'
	echo '--- -------  -------  -------'
	for (( i = 0; i < 16; ++i )); do
		echo -en "`seq -w $$i 17 16 | tr -d '\n'`: "
		for s in $^; do
			for c in 1 2 4; do
				if [ "$$s" == "schedule-clause++" ]; then
					id=`./$$s $$c 2> /dev/null`
				else
					id=`./$$s 16 $$c 2> /dev/null`
				fi
				id=`echo -e $$id | grep -m 1 "a\[$$i\] = [[:digit:]]*"`
				if [ -n "$$id" ]; then 
					id=$${id:7:1}; 
				else
					id='x';
				fi
				echo "$$id."
			done | tr '[[:space:]].' ' '
		done
		echo
	done

###############################################################################

mpi-pi: CC=$(MPICC)
mpi-pi++: CXX=$(MPICXX)

%.att: %
	objdump -C -d ./$< > ./$@

###############################################################################

.NOEXPORT:
.PHONY: all clean default perf stat tabla1 tabla2

###############################################################################
