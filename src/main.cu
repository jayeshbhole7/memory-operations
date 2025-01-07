#include <iostream>
#include <cuda_runtime.h>

using namespace std;

int main{

    const int n =1024;

    int a[n],b[n];

    for(int i=0;i<n;i++) a[i]=i;

    int *d_a,*d_b;

    cudaMalloc(&d_a, n*sizeof(int));
    cudaMalloc(&d_b, n*sizeof(int));

    cudaMemcpy(d_a,a,n*sizeof(int), cudaMemcpyDeviceToHost);
    
    memory_read_write<<n/256,256>>(d_a,d_b,n);

    cudaMemcpy(b,d_b,n*sizeof(int), cudaMemcpyDeviceToHost);

    for(int i=0;i<10;i++) cout<<b[i]<<"";

    cudaFree(d_a);
    cudaFree(d_b);

    return 0;
}
