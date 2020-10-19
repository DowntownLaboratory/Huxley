#!/bin/bash

script="mkarchiso -v -w work/ -o out/ arch-linux-installer/"
[ "$UID" -eq 0 ] || exec sudo ${script}
mvr --update out/*.iso /mnt/hyperv/