/* SumaVectoresC.c 
Suma de dos vectores: v3 = v1 + v2
Para compilar usar (-lrt: real time library):  
 gcc  -O2 SumaVectores.c -o SumaVectores –lrt
 gcc  -O2 –S SumaVectores.c –lrt   //para generar el código ensamblador
 Para ejecutar use: SumaVectoresC longitud
*/
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h> // biblioteca donde se encuentra la función clock_gettime()
#include <omp.h>// biblioteca Open MP
//Sólo puede estar definida una de las tres constantes VECTOR_ (sólo uno de los ... 
//tres defines siguientes puede estar descomentado):
//#define VECTOR_LOCAL // descomentar para que los vectores sean variables ...
	// locales (si se supera el tamaño de la pila se ...
	// generará el error "Violación de Segmento")
//#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
	// globales (su longitud no estará limitada por el ...
	// tamaño de la pila del programa)
#define VECTOR_DYNAMIC	// descomentar para que los vectores sean variables ...
	// dinámicas (memoria reutilizable durante la ejecución)
#ifdef VECTOR_GLOBAL
#define MAX 33554432	//=2^25
double v1[MAX], v2[MAX], v3[MAX]; 
#endif

int main(int argc, char** argv){ 

	int i; 
	double cgt1,cgt2;
	double ncgt; //para tiempo de ejecución
	//Leer argumento de entrada (nº de componentes del vector)
	if (argc<2){
	printf("Faltan nº componentes del vector\n");
	exit(-1);
	}
	unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
	#ifdef VECTOR_LOCAL
	double v1[N], v2[N], v3[N];	// Tamaño variable local en tiempo de ejecución ...
	// disponible en C a partir de actualización C99 
	#endif
	#ifdef VECTOR_GLOBAL
	if (N>MAX) N=MAX;
	#endif
	#ifdef VECTOR_DYNAMIC
	double *v1, *v2, *v3;
	v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
	v2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
	v3 = (double*) malloc(N*sizeof(double));
	if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){
	printf("Error en la reserva de espacio para los vectores\n");
	exit(-2);
	}
	#endif

	//Inicializar vectores
	#pragma omp parallel for
		for(i=0; i<N; i++)
		{ 
			v1[i] = N*0.1+i*0.1; v2[i] = N*0.1-i*0.1; //los valores dependen de N
		}

	cgt1 = omp_get_wtime();
	//Calcular suma de vectores
	#pragma omp parallel for
		for(i=0; i<N; i++) 
			v3[i] = v1[i] + v2[i]; 

	cgt2 = omp_get_wtime();
	ncgt= cgt2 - cgt1;

	//Imprimir resultado de la suma y el tiempo de ejecución
	if(N < 20)
	{
		printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",ncgt,N); 
		for(i=0; i<N; i++) 
		printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",i,i,i,v1[i],v2[i],v3[i]);

		printf("V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
				  v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
	}
	else
	{
		printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
				  ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
	}
	
	#ifdef VECTOR_DYNAMIC
	free(v1); // libera el espacio reservado para v1
	free(v2); // libera el espacio reservado para v2
	free(v3); // libera el espacio reservado para v3
	#endif
	return 0; 
}
