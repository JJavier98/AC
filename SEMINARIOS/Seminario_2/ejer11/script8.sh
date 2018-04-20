#!/bin/bash

export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=1

NUM=5000
T=1

while [ $T -le 4 ]; do
    ./../ejer8/productoMxV-dinamico $NUM >> datos-5000-ejer8-pc.txt
	
	let T1=$T+1
	export OMP_NUM_THREADS=$T
done

NUM2=70000
T=1
export OMP_NUM_THREADS=$T

while [ $T -le 4 ]; do
    ./../ejer8/productoMxV-dinamico $NUM2 >> datos-70000-ejer8-pc.txt
	
	let T1=$T+1
	export OMP_NUM_THREADS=$T
done
