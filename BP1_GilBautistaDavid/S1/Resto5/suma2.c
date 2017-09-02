#include <omp.h>
#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la función printf()
#include <time.h>// biblioteca donde se encuentra la función clock_gettime()
#define VECTOR_GLOBAL// descomentar para que los vectores sean variables ...
 // globales (su longitud no estará limitada por el ...
 // tamaño de la pila del programa)
//#define PRINTF_ALL// comentar para quitar el printf ...
 // que imprime todos los componentes
#ifdef VECTOR_GLOBAL
	#define MAX 33554432 //=2^25
	double v1[MAX], v2[MAX], v3[MAX];
#endif

int main(int argc, char** argv){

 int i;
 //Leer argumento de entrada (nº de componentes del vector)
 if (argc<2){
 printf("Faltan nº componentes del vector\n");
 exit(-1);
 }

 unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

	#pragma omp sections
	{

	#pragma omp section
		 for(i=0; i<N/4; i++){
			 v3[i] = v1[i] + v2[i];
			 printf("/ Tamaño Vectores:%u / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",N,i,i,i,v1[i],v2[i],v3[i]);
		}
	#pragma omp section
		for(i=N/4; i<N/3; i++){
			v3[i] = v1[i] + v2[i];
			printf("/ Tamaño Vectores:%u / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",N,i,i,i,v1[i],v2[i],v3[i]);
		}

	#pragma omp section
		for(i=N/3; i<N/2; i++){
			v3[i] = v1[i] + v2[i];
			printf("/ Tamaño Vectores:%u / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",N,i,i,i,v1[i],v2[i],v3[i]);
		}

	#pragma omp section
		for(i=N/2; i<N; i++){
			v3[i] = v1[i] + v2[i];
			printf("/ Tamaño Vectores:%u / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",N,i,i,i,v1[i],v2[i],v3[i]);
		}

	}
 
double start, end;
  start=  omp_get_wtime();
 
 //Calcular suma de vectores
 #pragma omp parallel for
 for(i=0; i<N; i++){
 v3[i] = v1[i] + v2[i];
printf("/ Tamaño Vectores:%u / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",N,i,i,i,v1[i],v2[i],v3[i]);
}

 end= omp_get_wtime();
 
 double tiempo= 0;

 tiempo = end - start;


 printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\n",tiempo,N);
 
 //printf("/ V1[8]+V2[8]=V3[8](%8.6f+%8.6f=%8.6f) /\n",v1[7],v2[7],v3[7]);
 printf("/ V1[11]+V2[11]=V3[11](%8.6f+%8.6f=%8.6f) /\n",v1[10],v2[10],v3[10]);
 
  return 0;
}
