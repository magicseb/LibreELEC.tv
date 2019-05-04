#!/bin/sh

UPGRADE_IMG=$2

RPI_REVISION=$(hexdump -ve '1/1 "%.2x"' </proc/device-tree/system/linux,revision)
RPI_CPU=${RPI_REVISION:4:1}

if echo $UPGRADE_IMG | grep -qE "^RPi.\.*"; then
  if [ $UPGRADE_IMG = "RPi3.arm" -a $RPI_CPU = "2" ]; then
    exit 0
  else
    echo "ERROR: canupdate.sh: cpu unsupported by $UPGRADE_IMG image - not a BCM2837"
    exit 1
  fi
else
  echo "ERROR: canupdate.sh: not a Raspberry Pi image?"
  exit 1
fi
