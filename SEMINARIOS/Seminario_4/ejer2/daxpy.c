#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char const *argv[])
{
	srand(time(NULL));

	struct timespec cgt1,
					cgt2;
	double 			ncgt; //para tiempo de ejecución

	const int tamanioVector = 800000;
	const double cte = rand()%500000;

	double vector1[tamanioVector];
	double vector2[tamanioVector];

	for (int i = 0; i < tamanioVector; ++i)
	{
		vector1[i] = rand()%500000;
		vector2[i] = rand()%500000;

		vector2[i] += cte*vector1[i];
	}

	return 0;
}