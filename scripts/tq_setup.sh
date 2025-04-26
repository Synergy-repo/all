#!/bin/bash

pushd $(dirname $0)/../TinyQuanta

sudo bash ./requeriments.sh

pushd ./CheapPreemptions/src
make -j
popd

#pushd ./leveldb
#make -f tq.mk
#popd

pushd ./fake_work_cp
make -j libfake
make -j libfake_cp
popd

make 

