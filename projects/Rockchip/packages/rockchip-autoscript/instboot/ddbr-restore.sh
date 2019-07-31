#!/bin/sh

image="EMMC-backup.img.gz"

OUTDIR=$1

if [ "$OUTDIR" = "" ]
then
    OUTDIR="/storage/backup/ddbr"
else
    if [ ! -d "$OUTDIR" ] ; then
        echo " PROGRAM EXITED DUE TO ERROR: NO DIR $OUTDIR !!!"
        exit 1
    fi
fi

emmc=$2

#echo "Start FULL restore eMMC to eMMC"

if [ "$emmc" = "" ]
then
    if grep /dev/mmcblk0 /proc/mounts | grep flash ; then
	emmc="/dev/mmcblk1"
    else
	emmc="/dev/mmcblk0"
    fi
else
    if [ ! -e "$emmc" ] ; then
	echo "Not found EMMC !!!!"
	exit 1
	fi
fi

if [ ! -f "$OUTDIR/$image" ] ; then
    echo "Not found file backup $OUTDIR/$image"
    exit 1
fi

gunzip -c $OUTDIR/$image | dd of=$emmc

echo "Done! restore backup completed."
poweroff
exit 0
