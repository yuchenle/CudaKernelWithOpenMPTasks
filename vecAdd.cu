extern "C" {

#include <stdio.h>
__global__ void vecAdd(int n, double* x, double* y)
{
   int i = blockIdx.x * blockDim.x + threadIdx.x;
   for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
      y[idx] += x[idx];
      if (idx==0) printf("after modif, y[%d] = %f\n", idx, y[idx]);
   }
}

void vecAdd_wrapper(int n, double *x, double *y) {
  vecAdd<<<256,256>>>(n,x,y);
  cudaDeviceSynchronize();
}

} //extern "C"
