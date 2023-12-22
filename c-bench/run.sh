#!/bin/bash

if [ ! -d ./csv ]
then
    mkdir csv
fi

build/dense-dense > csv/DxD.csv
build/dense-dense 1024 >> csv/DxD.csv
build/dense-dense 2048 >> csv/DxD.csv

build/coo > csv/COO.csv
build/coo 1024 >> csv/COO.csv
build/coo 2048 >> csv/COO.csv

build/csr > csv/CSR.csv
build/csr 1024 >> csv/CSR.csv
build/csr 2048 >> csv/CSR.csv

build/ell > csv/ELL.csv
build/ell 1024 >> csv/ELL.csv
build/ell 2048 >> csv/ELL.csv

build/bcsr1 > csv/BCSR.csv
build/bcsr1 1024 >> csv/BCSR.csv
build/bcsr1 2048 >> csv/BCSR.csv

