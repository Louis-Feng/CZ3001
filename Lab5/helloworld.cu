#include <stdio.h>
__global__ void hello_GPU(void){
	int i = threadIdx.x;
	printf("hello from GPU[%d]!\n",i);

}
int main(void){
 printf("Hello, World - from CPU!\n");
 hello_GPU<<<2,3>>>();

 cudaDeviceSynchronize();
 return 0;
 }

