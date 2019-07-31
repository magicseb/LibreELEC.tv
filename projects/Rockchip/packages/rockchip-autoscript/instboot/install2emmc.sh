#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

if grep /dev/mmcblk0 /proc/mounts | grep flash ; then
    DEV_EMMC=/dev/mmcblk1
else
    DEV_EMMC=/dev/mmcblk0
fi

mount -o rw,remount /flash

dd if="${DEV_EMMC}" of=/flash/u-boot-default.img bs=1M count=16

umount -f "${DEV_EMMC}p1"
umount -f "${DEV_EMMC}p2"
umount -f "${DEV_EMMC}p7"
parted -s "${DEV_EMMC}" mklabel msdos
parted -s "${DEV_EMMC}" mkpart primary fat32 16M 532M
parted -s "${DEV_EMMC}" mkpart primary ext4 533M 565M

if [ -f /flash/u-boot/uboot.img ] ; then
    dd if=/flash/u-boot/uboot.img of="${DEV_EMMC}" conv=fsync seek=16384
fi

sync

IMAGE_KERNEL="/flash/KERNEL"
IMAGE_SYSTEM="/flash/SYSTEM"
IMAGE_DTB="/flash/dtb"
SCRIPT_EMMC="/flash/extlinux/extlinux.conf"

if [ -f $IMAGE_KERNEL -a -f $IMAGE_SYSTEM -a -f $SCRIPT_EMMC ] ; then

    umount -f "${DEV_EMMC}p1"
    mkfs.vfat -n "LE_EMMC" "${DEV_EMMC}p1"
    mkdir -p /tmp/system
    mount "${DEV_EMMC}p1" /tmp/system

    if grep -q "${DEV_EMMC}p1" /proc/mounts ; then

        cp $IMAGE_KERNEL /tmp/system && sync
        cp $IMAGE_SYSTEM /tmp/system && sync
        cp -r $IMAGE_DTB /tmp/system && sync
	mkdir /tmp/system/extlinux
        cp $SCRIPT_EMMC /tmp/system/extlinux && sync
        sed -e "s/LIBREELEC/LE_EMMC/g" \
          -e "s/STORAGE/DATA_EMMC/g" \
          -i "/tmp/system/extlinux/extlinux.conf"

        umount /tmp/system

	umount -f "${DEV_EMMC}p2"
        mkfs.ext4 -F -L DATA_EMMC "${DEV_EMMC}p2"
        e2fsck -n "${DEV_EMMC}p2"
        mkdir -p /tmp/data
        mount -o rw "${DEV_EMMC}p2" /tmp/data
	echo "" > /tmp/data/.please_resize_me
        umount /tmp/data
	sync

        poweroff
        exit 0
    else
	echo "No $DEV_EMMC partiton."
	exit 1
    fi
else
    echo "No LE image found on /flash! Exiting..."
    exit 1
fi
