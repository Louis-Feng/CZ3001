#include <stdio.h>
__global__ void vector_add(int *d_a, int *d_b, int *d_c, int n){
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	d_c[i] = d_a[i] + d_b[i];
}

int main(void){
 printf("Hello, World - from CPU!\n");
 int a[4] = {22,13,16,5};
 int b[4] = {5,22,17,37};
 int c[4];
 int *d_a; 
 int *d_b;
 int *d_c;
 cudaMalloc((void**)&d_a,sizeof(int)*4);
 cudaMalloc((void**)&d_b,sizeof(int)*4);
 cudaMalloc((void**)&d_c,sizeof(int)*4);
 cudaMemcpy(d_a,a,sizeof(int)*4,cudaMemcpyHostToDevice);
 cudaMemcpy(d_b,b,sizeof(int)*4,cudaMemcpyHostToDevice);
 //cudaMemcpy(d_c,c,sizeof(int)*4,cudaMemcpyHostToDevice);
 vector_add<<<1,4>>>(d_a,d_b,d_c,4);
 cudaMemcpy(c,d_c,sizeof(int)*4,cudaMemcpyDeviceToHost);
 
 printf("%d,%d,%d,%d\n",c[0],c[1],c[2],c[3]);
 return 0;
 }
