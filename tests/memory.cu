#include <iostream>
#include <cuda_runtime.h>
#include <cassert>

__global__ void test_kernal(int* input,int* output,int arr_io){

}

void test_memory_read_write(){
    const int s_of_memory_allotted = 1024;

    int h_input[s_of_memory_allotted], h_output[s_of_memory_allotted];

    for(int i=0; i<s_of_memory_allotted;i++) h_input[i]=i;

    int* d_input, *d_output;
    cudaMalloc(&d_input,s_of_memory_allotted*sizeof(int));
    cudaMalloc(&d_output,s_of_memory_allotted*sizeof(int));

    cudaMemcpy(d_input, h_input, s_of_memory_allotted * sizeof(int), cudaMemcpyHostToDevice);

    test_kernal<<<s_of_memory_allotted/256, 256>>>(d_input,d_output,s_of_memory_allotted);

    cudaMemcpy(h_output, h_input, s_of_memory_allotted* sizeof(int),cudaMemcpyDeviceToHost);

    for(int i=0;i<s_of_memory_allotted; i++) assert(h_output[i]== h_input[i]*2);

    cudaFree(d_input);
    cudaFree(d_output);
}

int main(){
    test_memory_read_write();
}