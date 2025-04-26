#!/bin/bash

pushd $(dirname $0)/../shinjuku

git submodule update --init --recursive
./deps/fetch-deps.sh
sudo apt-get install libconfig-dev libnuma-dev
sudo ./setup.sh
sudo make clean
sudo make -sj64

popd
