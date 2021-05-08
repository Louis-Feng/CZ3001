#include <stdio.h>
__global__ void dot_product(int *d_a, int *d_b,int *d_c){
	int i = threadIdx.x;
	__shared__ int temp[4];
	temp[i] = d_a[i] * d_b[i];
 	__syncthreads();
	if(i==1){
	int sum = 0;
	sum = temp[0]+temp[1]+temp[2]+temp[3];	
	*d_c = sum;	
}
}

int main(void){
 printf("Hello, World - from CPU!\n");
 int a[4] = {22,13,16,5};
 int b[4] = {5,22,17,37};
 int c[0];
 int *d_a; 
 int *d_b;
 int *d_c;
 cudaMalloc((void**)&d_a,sizeof(int)*4);
 cudaMalloc((void**)&d_b,sizeof(int)*4);
 cudaMalloc((void**)&d_c,sizeof(int));
 cudaMemcpy(d_a,a,sizeof(int)*4,cudaMemcpyHostToDevice);
 cudaMemcpy(d_b,b,sizeof(int)*4,cudaMemcpyHostToDevice);

 dot_product<<<2,2>>>(d_a,d_b,d_c);
 cudaMemcpy(c,d_c,sizeof(int)*1,cudaMemcpyDeviceToHost);
 printf("%d",c[0]);
 
 //printf("%d,%d,%d,%d\n",c[0],c[1],c[2],c[3]);
 return 0;
 }
