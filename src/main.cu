#include <iostream>
#include <cuda_runtime.h>

using namespace std;


__global__ void memory_read_write(int* input,int* output,int n){
    int index = threadIdx.x + blockIdx.x*blockDim.x;
    if(index < n){
        output[index] = input[index]*2; //read_write_memory
    }
}

int main(){

    const int s_of_data_processed =1024;

    int h_input[s_of_data_processed],h_output[s_of_data_processed];

    for(int i=0;i<s_of_data_processed;i++) h_input[i]=i;

    int* d_input,*d_output;
    cudaMalloc(&d_input,s_of_data_processed*sizeof(int));
    cudaMalloc(&d_output,s_of_data_processed*sizeof(int));


    cudaMemcpy(d_input,h_input,s_of_data_processed*sizeof(int), cudaMemcpyHostToDevice);
    
    memory_read_write<<<s_of_data_processed/256,256>>>(d_input,d_output,s_of_data_processed);

    cudaMemcpy(h_output,d_output,s_of_data_processed*sizeof(int), cudaMemcpyDeviceToHost);

    for(int i=0;i<s_of_data_processed;i++) cout<<h_output[i]<<" ";

    cudaFree(d_input);
    cudaFree(d_output);

    return 0;
}
