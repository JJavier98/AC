#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

int main(int argc, char const *argv[])
{
	if (argc<2)
	{
		printf("Faltan tamaño de la matriz\n");
		exit(-1);
	}
	struct timespec cgt1,
					cgt2;
	double 			ncgt; //para tiempo de ejecución
	int 			N 	= atoi(argv[1]),
					i,
					j;
	double 			**m;
	double 			*v, *v_res;

		m = (double**) malloc(N*sizeof(double*));
		v = (double*) malloc(N*sizeof(double));
	v_res = (double*) malloc(N*sizeof(double));
	
	srand(time(NULL));
	#pragma omp parallel for
	for(i = 0 ; i < N ; ++i)
	{
		m[i] = (double*) malloc(N*sizeof(double));
		v[i] = 2;//rand();
		v_res[i] = 0;

		for(j=0 ; j < N ; ++j)
		{
			m[i][j] = 2;//rand();
		}
	}

	clock_gettime(CLOCK_REALTIME,&cgt1);
	for(i=0; i<N; i++){
        #pragma omp parallel for reduction(+:v_res[i])
        for(j=0; j<N; j++){
            v_res[i] += m[i][j]*v[j];
        }
    }

    clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt = 	(double) (cgt2.tv_sec-cgt1.tv_sec)+
		 	(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	if(N <= 15)
	{
		for(i = 0 ; i < N ; ++i)
		{
			printf("v[%d]: %f\n", i, v_res[i]);
		}
	}
	else
	{
		printf("v[0]: %f\n", v_res[0]);
		printf("v[%d]: %f\n", N-1, v_res[N-1]);
	}

	for(i = 0 ; i < N ; ++i)
		free(m[i]);
	free(m);

	printf("tiempo: %11.9f\n", ncgt);

	return 0;
}