#!/bin/bash

pushd $(dirname $0)/synergy
./scripts/set_boot_params.sh
popd

sudo reboot

