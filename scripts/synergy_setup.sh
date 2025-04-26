#!/bin/bash

pushd $(dirname $0)/../synergy

./install_requirements.sh
./scripts/install_leveldb.sh
./scripts/install_concord.sh
./scripts/install_concord_leveldb.sh
./scripts/install_dpdk.sh
make fakework

make synergy
make -C apps/fake/ APP=synergy

popd

