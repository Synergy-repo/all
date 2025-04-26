#!/bin/bash

#workload=$1
#rate=$2
#app=$3
#dir="/proj/demeter-PG0/users/fabricio/synergy_tests/tests/exponential/${workload}/${app}/${rate}/"
echo $dir

#mkdir -p $dir

sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb 1000

pushd $(dirname $0)/../TinyQuanta

sudo ../synergy/deps/dpdk/usertools/dpdk-devbind.py -b igb_uio 18:00.1
./run_server.sh

popd
