#include <iostream>
#include <cuda_runtime.h>

using namespace std;


__global__ void memory_read_write(int* input,int* output,int n){
}

int main(){

    const int s_of_data_processed =1024;

    int input[s_of_data_processed],output[s_of_data_processed];

    for(int i=0;i<s_of_data_processed;i++) input[i]=i;

    int *d_input,*d_output;

    if(cudaMalloc(&d_input,s_of_data_processed*sizeof(int))!=cudaSuccess){
        cerr<<"cuda malloc fails for d_a\n";
        return -1;
    }
    if(cudaMalloc(&d_output,s_of_data_processed*sizeof(int))!=cudaSuccess){
        cerr<<"cuda malloc fails for d_b\n";
        return -1;
    }

    cudaMemcpy(d_input,input,s_of_data_processed*sizeof(int), cudaMemcpyHostToDevice);
    
    memory_read_write<<<s_of_data_processed/256,256>>>(d_input,d_output,s_of_data_processed);

    cudaMemcpy(output,d_output,s_of_data_processed*sizeof(int), cudaMemcpyDeviceToHost);

    for(int i=0;i<s_of_data_processed;i++) cout<<output[i]<<" ";

    cudaFree(d_input);
    cudaFree(d_output);

    return 0;
}
