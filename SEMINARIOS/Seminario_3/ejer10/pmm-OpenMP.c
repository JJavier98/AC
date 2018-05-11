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

	omp_set_dynamic(0);
	omp_set_num_threads( omp_get_num_procs()/2);

	struct timespec cgt1,
					cgt2;
	double 			ncgt; //para tiempo de ejecución
	int 			N 	= atoi(argv[1]),
					i,
					j;

	double **m1;
	double **m2, **m_res;

	printf("hola\n");

	m1 = (double **)malloc(N * sizeof(double *));
	m2 = (double **)malloc(N * sizeof(double *));
	m_res = (double **)malloc(N * sizeof(double *));

	printf("hola\n");

	srand(time(NULL));
	#pragma omp parallel for
	for(i = 0 ; i < N ; ++i)
	{
		m1[i] = (double *)malloc(N * sizeof(double));
		m2[i] = (double *)malloc(N * sizeof(double));
		m_res[i] = (double *)malloc(N * sizeof(double));

		for(j=0 ; j < N ; ++j)
		{
			m1[i][j] = m2[i][j] = rand()%5+1;
			m_res[i][j] = 0;
		}
	}
	
	clock_gettime(CLOCK_REALTIME,&cgt1);
	#pragma omp parallel for
	for(int i=0; i<N; ++i)
        for(int j=0; j<N; ++j)
            for(int z=0; z<N; ++z)
                m_res[i][j] += m1[i][z] * m2[z][j];

    clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt = 	(double) (cgt2.tv_sec-cgt1.tv_sec)+
		 	(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	if(N <= 15)
	{
		for(i = 0 ; i < N ; ++i)
		{
			for (int j = 0; j < N; ++j)
			{
				printf("m[%d][%d]: %f", i, j, m_res[i][j]);
			}
			printf("\n");
		}
	}
	else
	{
		printf("m[0][0]: %f\n", m_res[0][0]);
		printf("m[%d][%d]: %f\n", N-1, N-1, m_res[N-1][N-1]);
	}

	for (i = 0; i < N; ++i)
	{
		free(m1[i]);
		free(m2[i]);
		free(m_res[i]);
	}
	free(m1);
	free(m2);
	free(m_res);

	printf("tiempo:  %11.9f\n", ncgt);

	return 0;
}