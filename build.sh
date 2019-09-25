#!/bin/sh
PROJECT=RPi DEVICE=RPi4 ARCH=arm make image
PROJECT=RPi DEVICE=RPi4 ARCH=arm make clean
PROJECT=RPi DEVICE=RPi2 ARCH=arm make image
PROJECT=RPi DEVICE=RPi2 ARCH=arm make clean
PROJECT=RPi DEVICE=RPi3 ARCH=arm make image
PROJECT=RPi DEVICE=RPi3 ARCH=arm make clean
PROJECT=Rockchip DEVICE=RK3399 UBOOT_SYSTEM=rockpro64 ARCH=arm make image
PROJECT=Rockchip DEVICE=RK3399 UBOOT_SYSTEM=rockpro64 ARCH=arm make clean
