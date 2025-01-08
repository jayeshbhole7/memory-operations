#include <iostream>
#include <cuda_runtime.h>

using namespace std;


__global__ void memory_read_write(int *a,int *b,int n){
}

int main(){

    const int n =1024;

    int a[n],b[n];

    for(int i=0;i<n;i++) a[i]=i;

    int *d_a,*d_b;

    if(cudaMalloc(&d_a,n*sizeof(int))!=cudaSuccess){
        cerr<<"cuda malloc fails for d_a\n";
        return -1;
    }
    if(cudaMalloc(&d_a,n*sizeof(int))!=cudaSuccess){
        cerr<<"cuda malloc fails for d_b\n";
        return -1;
    }

    cudaMemcpy(d_a,a,n*sizeof(int), cudaMemcpyHostToDevice);
    
    memory_read_write<<<n/256,256>>>(d_a,d_b,n);

    cudaMemcpy(b,d_b,n*sizeof(int), cudaMemcpyDeviceToHost);

    for(int i=0;i<n;i++) cout<<b[i]<<" ";

    cudaFree(d_a);
    cudaFree(d_b);

    return 0;
}
