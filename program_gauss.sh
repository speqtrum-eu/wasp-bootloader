#!/bin/bash

# cd git/wasp-bootloader/
make BOARD=gauss_nrf52832 clean
make BOARD=gauss_nrf52832 all combinehex
openocd -c 'source [find interface/stlink.cfg]' -c 'transport select hla_swd' -c 'source [find target/nrf52.cfg]' -c 'init' -c 'halt' -c 'nrf5 mass_erase' -c 'program _build-gauss_nrf52832/gauss_nrf52832_bootloader-0.3.2-dirty_s132_6.1.1.hex verify' -c 'reset' -c 'exit'
