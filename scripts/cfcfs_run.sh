#!/bin/bash

sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb


pushd $(dirname $0)/../psp
sudo ./submodules/dpdk/usertools/dpdk-devbind.py -b igb_uio 18:00.1
mv ./build/src/c++/apps/app/psp-app ./build/src/c++/apps/app/cfcfs
sudo numactl -N0 -m0 ./build/src/c++/apps/app/cfcfs --cfg ./sosp_aec/configs/cfcfs.yml --label test
popd
