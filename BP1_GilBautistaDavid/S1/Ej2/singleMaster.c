#include <stdio.h>
#include <omp.h>

int main()  {
  int n = 9, i, a;
  int b[n];
  int t[n];

  for (i=0; i<n; i++)   b[i] = -3;
  #pragma omp parallel 
  {

     #pragma omp master
     {  printf("Introduce valor de inicialización a: "); 
        scanf("%d", &a );
        printf("Single ejecutada por el thread %d\n",
             omp_get_thread_num());
     }

     #pragma omp for
     for (i=0; i<n; i++){
        b[i] = a;
	t[i] = omp_get_thread_num();
     }

  }
  printf("Depués de la región parallel:\n");
  for (i=0; i<n; i++){   
  	printf("b[%d] = %d, thread no: %d\t",i,b[i],t[i]);
  	printf("\n");
  }
  return 0;
}
