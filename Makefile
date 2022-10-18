CC = clang
T_CC = nvcc
T_FLAGS = -fopenmp-targets=nvptx64-nvidia-cuda
OMP = -fopenmp

all: main

main: vecAdd.o main.o
	$(T_CC) $^ -o $@ $(OMPTARGET_LIB) $(OMP_LIB)

main.o: main.c
	$(CC) $(OMP) $(T_FLAGS) -c $^

vecAdd.o: vecAdd.cu
	$(T_CC) -c $^

.PHONY: clean

clean:
	rm main vecAdd.o main.o -f
