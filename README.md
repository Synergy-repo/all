### Clone
```sh
git clone --recurse-submodules https://github.com/Synergy-repo/all.git
```
### Setup server machine
edit/create MACHINE_CONFIG in ./synergy
```sh
./synergy/scripts/set_boot_params.sh; ./install_kernel.sh
reboot
```
### Prepare systems
```sh
./scripts/synergy_setup.sh
./scripts/psp_setup.sh
./scripts/shinjuku_setup.sh
./scripts/concord_setup.sh
./scripts/tq_setup.sh
```

### Run
```sh
./scripts/synergy_run.sh
```

## To setup client machine see
[udp_generator](https://github.com/Synergy-repo/udp_generator)
