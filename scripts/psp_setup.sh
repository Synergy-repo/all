#!/bin/bash

pushd $(dirname $0)/../psp
git submodule update --init --recursive
./install_requeriments.sh
./sosp_aec/base_setup.sh
popd
