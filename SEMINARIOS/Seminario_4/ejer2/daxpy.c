#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char const *argv[])
{
	
	struct timespec cgt1,
					cgt2;
	double 			ncgt; //para tiempo de ejecución
	

	const int tamanioVector = 80000;
	const int cte = 3548;

	int vector1[tamanioVector];
	int vector2[tamanioVector];

	clock_gettime(CLOCK_REALTIME,&cgt1);

	for (int i = 0; i < tamanioVector; ++i)
	{
		vector1[i] = i;
		vector2[i] = i;

		vector2[i] += cte*vector1[i];
	}

	
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt = 	(double) (cgt2.tv_sec-cgt1.tv_sec)+
		 	(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));
		 	

	printf("V2[0]: %d\n", vector2[0]);
	printf("V2[79999]: %d\n", vector2[79999]);
	printf("tiempo:  %11.9f\n", ncgt);

	return 0;
}