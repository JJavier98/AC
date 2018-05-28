#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <emmintrin.h>


struct {
	int a;
	int b;
} s[5000];

int main()
{
	int X1, X2;
	int R[40000];
	struct timespec cgt1,
					cgt2;
	double 			ncgt; //para tiempo de ejecución

	for (int i = 0; i < 5000; ++i)
	{
		s[i].a = i % 6;
		s[i].b = i % 12;
	}

	clock_gettime(CLOCK_REALTIME,&cgt1);

	for (int ii=0; ii<40000; ++ii){
		X1=0; X2=0;

		for(int i=0; i<5000;i+=5)
		{
			X1+=2*s[i].a+ii;
			X1+=2*s[i+1].a+ii;
			X1+=2*s[i+2].a+ii;
			X1+=2*s[i+3].a+ii;
			X1+=2*s[i+4].a+ii;

			X2+=3*s[i].b-ii;
			X2+=3*s[i+1].b-ii;
			X2+=3*s[i+2].b-ii;
			X2+=3*s[i+3].b-ii;
			X2+=3*s[i+4].b-ii;
			//_mm_prefetch(s[i+32],_MM_HINT_T0);
		}

		if (X1<X2)
			R[ii]=X1;
		else
			R[ii]=X2;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt = 	(double) (cgt2.tv_sec-cgt1.tv_sec)+
		 	(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("R[0]: %d\n", R[0]);
	printf("m[39999]: %d\n", R[39999]);
	printf("tiempo:  %11.9f\n", ncgt);
}