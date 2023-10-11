#!/bin/bash

if [[ ! -d ./build ]] ; then
	mkdir build
fi

cc matrix.c main1.c -o build/main1
cc matrix.c main2.c -o build/main2
cc matrix.c main3.c -o build/main3
cc matrix.c main4.c -o build/main4
