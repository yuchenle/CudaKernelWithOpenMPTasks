# CudaKernelWithOpenMPTasks
This is a simple example code showing how to do the trick to make cuda kernels executing with OpenMP task (not target).

In this example, we use LLVM toolchain + NVCC + Nvidia GPU.

There is need to specify two environment variables:
 - OMPTARGET_LIB: corresponding to the LLVM OMP target library, including variable mapping and offloading features.
 - OMP_LIB: This is needed for ordinary OpenMP functions (e.g., task).

The compilation logic is to:
 - First compile object files, clang for c file and nvcc for cu files.
 - Second, we use nvcc to link everything. By default, nvcc does not know where to look at for OpenMP related libraries, reason why we need to specify environment variables for the last step.
