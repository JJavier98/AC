#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif
int main(int argc, char **argv)
{
	int i, n=20, a[n],suma=0;
	if(argc < 2)
	{
		fprintf(stderr,"Falta iteraciones\n");
		exit(-1);
	}
	n = atoi(argv[1]);
	if (n>20)
	{
		n=20;
		printf("n=%d\n",n);
	}
	for (i=0; i<n; i++)
		a[i] = i;
	#pragma omp parallel
	{
		int sumalocal = 0;
		#pragma omp for
		for (i=0; i<n; i++)
		{
			sumalocal += a[i];
			printf(" thread %d suma de a[%d]=%d sumalocal=%d \n", omp_get_thread_num(),i,a[i],sumalocal);
		}
		#pragma omp atomic
		suma += sumalocal;
	}
	printf("Tras 'parallel' suma=%d\n",suma);
}