#!/bin/bash
echo "building"
docker build -t byg-img .
echo "running"
docker create --name byg-cont byg-img
echo "copying artifact"
docker cp byg-cont:/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc ./xtenza-lx106-elf-gcc
echo "done"