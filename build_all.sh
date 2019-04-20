#!/bin/bash

rm -rf target/

export IGNORE_VERSION=1
export OFFICIAL=yes
export DISTRO=LudOS

PROJECT=RPi DEVICE=RPi2 ARCH=arm make noobs
PROJECT=Generic ARCH=x86_64 make image
