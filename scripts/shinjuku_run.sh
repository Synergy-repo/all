#!/bin/bash

app=$1
db_size=$2
load=$3

sudo rm -rf /tmpfs/my_db/
sudo $(dirname $0)/../synergy/database/leveldb_createdb $db_size


pushd $(dirname $0)/../shinjuku

sudo ./deps/dpdk/tools/dpdk_nic_bind.py --force -u 18:00.1

if [[ "$load" = "high" || "$load" == "leveldb_high" ]]; then
  sed -i 's/queue_setting =.*/queue_setting = [true, true]/g' shinjuku.conf
else
  sed -i 's/queue_setting =.*/queue_setting = [false]/g' shinjuku.conf
fi

sudo ./dp/${app}

popd
