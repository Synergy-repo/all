#!/bin/bash

pushd $(dirname $0)/../concord

git submodule update --init --recursive
./setup.sh

pushd concord-shinjuku
./deps/fetch-deps.sh
sudo apt-get install libconfig-dev libnuma-dev
sudo ./setup.sh

sudo make clean 2> /dev/null
sudo make -j6 -s LOAD_LEVEL=0 RUN_UBENCH=1 BENCHMARK_TYPE=1 DISPATCHER_DO_WORK=1 SCHEDULE_METHOD=3
mv dp/shinjuku dp/concord

popd
popd
