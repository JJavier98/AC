#!/bin/bash
#PBS -N ejer-10
#PBS -q ac


T=100

while [ $T -le 1500 ]; do

    ./pmm-OpenMP $T
	
	let T=$T+1400
done
