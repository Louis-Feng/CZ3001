#include <stdio.h>
__global__ void sale(int *GPU_arr, int *GPU_price,int *GPU_out){
	int i = blockIdx.x*blockDim.x + threadIdx.x;
	__shared__ int temp[4];
	temp[threadIdx.x] = GPU_arr[i] * GPU_price[threadIdx.x];
 	__syncthreads();
	if(threadIdx.x==0){
	float sum = 0;
	sum = temp[0]+temp[1]+temp[2]+temp[3];	
	GPU_out[blockIdx.x] = sum;	
}
}

int main(void){
 int days = 7;
 int items = 4;
 int arr[28] = {
	3,5,2,0,
	2,4,5,1,
	0,3,3,1,
	3,5,4,4,
	4,5,5,3,
	10,13,21,16,
	8,11,15,8
};
 float prices[4] = {29.99,14.99,9.99,24.99};
 float out[7];
 int *GPU_arr;
 int *GPU_price; 
 int *GPU_out;
 cudaMalloc((void**)&GPU_arr,sizeof(int)*28);
 cudaMalloc((void**)&GPU_price,sizeof(float)*4);
 cudaMalloc((void**)&GPU_out,sizeof(float)*7);
 cudaMemcpy(GPU_arr,arr,sizeof(int)*28,cudaMemcpyHostToDevice);
 cudaMemcpy(GPU_price,prices,sizeof(float)*4,cudaMemcpyHostToDevice);

 sale<<<7,4>>>(GPU_arr,GPU_price,GPU_out);
 cudaMemcpy(out,GPU_out,sizeof(float)*7,cudaMemcpyDeviceToHost);
 //printf("%d",*c);
 
 //printf("%d,%d,%d,%d\n",c[0],c[1],c[2],c[3]);
 return 0;
 }
