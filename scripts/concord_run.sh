#!/bin/bash

db_size=$1
sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb $db_size


pushd $(dirname $0)/../concord/concord-shinjuku

sudo ./deps/dpdk/tools/dpdk_nic_bind.py --force -u 18:00.1
sudo ./dp/concord

popd
