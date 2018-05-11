#!/bin/bash
#PBS -N salida-guided
#PBS -q ac

#read -p "Selecciona tipo de planificación -> static, dynamic, guided: " plan
plan="guided"

export OMP_SCHEDULE=$plan
./pmtv-OpenMP

plan=$plan","

T=1

export OMP_NUM_THREADS=12

while [ $T -le 64 ]; do
    var=$plan$T
    export OMP_SCHEDULE=$var
    ./pmtv-OpenMP
	
	let T=$T+63
done
