#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) {
    int i, n = 200, chunk, a[n], suma = 0;
    omp_sched_t kind;
    int modifier;

    if (argc < 3) {
        fprintf(stderr, "\nFalta iteraciones o chunk \n");
        exit(-1);
    }

    n = atoi(argv[1]);
    if (n > 200) n = 200;
    chunk = atoi(argv[2]);

    for (i = 0; i < n; i++) a[i] = i;

    #pragma omp parallel
    {
        #pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk)
        for (i = 0; i < n; i++) {
            suma = suma + a[i];
            printf(" thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(), i, a[i], suma);
        }

        #pragma omp single
        {
            omp_get_schedule(&kind, &modifier);

            printf("\nDentro del parallel: dyn-var: %d, nthreads-var: %d, thread-limit-var: %d,
             run-sched-var[kind: %d, modifier: %d]\n",
              omp_get_dynamic(), omp_get_max_threads(), omp_get_thread_limit(), kind, modifier);

            printf("Nº de threads que se están usando en el parallel: %d\n", omp_get_num_threads());
            printf("Nº de procesadores disponibles para el programa en el momento de ejecución: %d\n",
             omp_get_num_procs());
            
            printf("¿Dentro de una region parallel? (0:falso, 1: verdadero): %d\n", omp_in_parallel());
        }
    }

    printf("\nFuera de 'parallel for' suma=%d\n", suma);

    omp_get_schedule(&kind, &modifier);

    printf("\nFuera del parallel: dyn-var: %d, nthreads-var: %d, thread-limit-var: %d,
     run-sched-var[kind: %d, modifier: %d]\n", omp_get_dynamic(), omp_get_max_threads(),
      omp_get_thread_limit(), kind, modifier);

    printf("Nº de threads que se están usando en el parallel: %d\n", omp_get_num_threads());
    printf("Nº de procesadores disponibles para el programa en el momento de ejecución: %d\n",
     omp_get_num_procs());

    printf("¿Dentro de una region parallel? (0:falso, 1: verdadero): %d\n", omp_in_parallel());
}