#include <stdio.h>
#include <omp.h>
#include <stdlib.h>

#define N 330381

extern void vecAdd_wrapper(int, void *, void *);
int main(int argc, char **argv) {
  double *X, *Y;

  X = (double *)malloc(sizeof(double) * N);
  Y = (double *)malloc(sizeof(double) * N);

  for (int i=0; i<N; ++i) X[i]=5;
  for (int i=0; i<N; ++i) Y[i]=1;

  #pragma omp target enter data map(to:X[0:N],Y[0:N])

  #pragma omp task
  vecAdd_wrapper(N, X,Y);

  #pragma omp target exit data map(from:Y[0:N])

  printf("Y[0] = %f\n", Y[0]);

  return 0;
}
