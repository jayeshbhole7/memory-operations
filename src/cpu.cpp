#include <iostream>
#include <chrono>

using namespace std;

void cpu_memory_read_write(const int* input, int* output,int n){
    for(int i=0;i<n;i++){
        output[i] = input[i]*2;
    }
}

int main(){
    const int arr_io=1024;

    int input[arr_io], output[arr_io];

    for(int i=0;i<arr_io;i++)
    input[i]=i;

    auto start=chrono::high_resolution_clock::now();

    cpu_memory_read_write(input,output,arr_io);
    
    auto finish = chrono::high_resolution_clock::now();

    for(int i=0; i<10; i++)
    cout<<output[i]<< " ";

    cout<<"execution time:"<<chrono::duration_cast<chrono::microseconds>(finish-start).count()<<" ss\n";
    return 0;
}