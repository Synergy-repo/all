#!/bin/bash

db_size=$1
sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb $db_size

pushd $(dirname $0)/../psp
sudo ./submodules/dpdk/usertools/dpdk-devbind.py -b igb_uio 18:00.1
./run.sh
popd
