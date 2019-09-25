#!/bin/bash

rm -rf target/

export IGNORE_VERSION=1
export OFFICIAL=yes
export DISTRO=LudOS
export THREADCOUNT=8

PROJECT=Generic ARCH=x86_64 make image
PROJECT=RPi DEVICE=RPi2 ARCH=arm make noobs
PROJECT=RPi DEVICE=RPi4 ARCH=arm make noobs
