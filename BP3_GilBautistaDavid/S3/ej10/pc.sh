#!/bin/bash

export OMP_DYNAMIC=FALSE

echo "Tiempo secuencial con 100"
./sec 100

export OMP_NUM_THREADS=2
echo "Tiempo con dos threads con 100"
./omp 100

export OMP_NUM_THREADS=4
echo "Tiempo con cuatro threads con 100"
./omp 100

echo "--------------------------------------------------"

echo "Tiempo secuencial con 500"
./sec 500

export OMP_NUM_THREADS=2
echo "Tiempo con dos threads con 500"
./omp 500

export OMP_NUM_THREADS=4
echo "Tiempo con cuatro threads con 500"
./omp 500

echo "--------------------------------------------------"

echo "Tiempo secuencial con 1000"
./sec 1000

export OMP_NUM_THREADS=2
echo "Tiempo con dos threads con 1000"
./omp 1000

export OMP_NUM_THREADS=4
echo "Tiempo con cuatro threads con 1000"
./omp 1000

echo "--------------------------------------------------"

echo "Tiempo secuencial con 1500"
./sec 1500

export OMP_NUM_THREADS=2
echo "Tiempo con dos threads con 1500"
./omp 1500

export OMP_NUM_THREADS=4
echo "Tiempo con cuatro threads con 1500"
./omp 1500

echo "--------------------------------------------------"