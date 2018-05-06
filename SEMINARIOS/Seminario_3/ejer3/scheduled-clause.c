#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
	int i, n=200,chunk,a[n],suma=0;
	omp_sched_t kind;
	int modifier;
	char respuesta[2];
	if(argc < 3)
	{
		fprintf(stderr,"\nFalta iteraciones o chunk \n");
		exit(-1);
	}
	n = atoi(argv[1]); if (n>200) n=200; chunk = atoi(argv[2]);

	for (i=0; i<n; i++)
		a[i] = i;

	#pragma omp parallel for firstprivate(suma) \
	lastprivate(suma) schedule(dynamic,chunk)
	for (i=0; i<n; i++)
	{
		suma = suma + a[i];
		printf(" thread %d suma a[%d]=%d suma=%d \n",
		omp_get_thread_num(),i,a[i],suma);
		if(i == 0)
		{
			if(omp_get_dynamic())
			{
				respuesta[0] = 's';
				respuesta[1] = 'i';
			}
			else
			{
				respuesta[0] = 'n';
				respuesta[1] = 'o';
			}
			printf("\n\n");
			printf("Puede alterar el nº de threads dinámicamente? %s\n", respuesta);
			printf("Número actual de hebras: %d\n", omp_get_max_threads());
			printf("Limite de hebras: %d\n", omp_get_thread_limit());
			omp_get_schedule(&kind, &modifier);
			printf("Tipo de distribución de hebras %d. Modificador: %d\n",kind, modifier);
			printf("\n\n");
		}
	}

	printf("Fuera de 'parallel for' suma=%d\n",suma);
	printf("\n\n");
	printf("Puede alterar el nº de threads dinámicamente? %s\n", respuesta);
	printf("Número actual de hebras: %d\n", omp_get_max_threads());
	printf("Limite de hebras: %d\n", omp_get_thread_limit());
	omp_get_schedule(&kind, &modifier);
	printf("Tipo de distribución de hebras %d. Modificador: %d\n",kind, modifier);
	printf("\n\n");
}