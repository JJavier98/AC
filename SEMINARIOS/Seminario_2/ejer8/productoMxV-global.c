#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX 1000

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

	double 			m[MAX][MAX];
	double 			v[MAX], v_res[MAX];
	
	srand(time(NULL));
	for(i = 0 ; i < N ; ++i)
	{
		v[i] = rand();
		v_res[i] = 0;
		for(j=0 ; j < N ; ++j)
		{
			m[i][j] = rand();
		}
	}

	double tmp;
	clock_gettime(CLOCK_REALTIME,&cgt1);

	for(i=0; i<N; i++){
        tmp=0;
        for(j=0; j<N; j++){
            tmp += m[i][j]*v[j];
        }
        v_res[i] = tmp;
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

	printf("tiempo: %11.9f\n", ncgt);

	return 0;
}