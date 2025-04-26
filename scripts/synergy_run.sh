#!/bin/bash

app=$1

mkdir -p $dir

db_size=$2
sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb $db_size

pushd $(dirname $0)/../synergy

sudo ./deps/dpdk/usertools/dpdk-devbind.py -b igb_uio 18:00.1
make run -C apps/leveldb/ APP=${app}

popd
