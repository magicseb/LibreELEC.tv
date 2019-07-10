# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

[ -z "$SYSTEM_ROOT" ] && SYSTEM_ROOT=""
[ -z "$BOOT_ROOT" ] && BOOT_ROOT="/flash"
[ -z "$BOOT_PART" ] && BOOT_PART=$(df "$BOOT_ROOT" | tail -1 | awk {' print $1 '})
if [ -z "$BOOT_DISK" ]; then
  case $BOOT_PART in
    /dev/sd[a-z][0-9]*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,[0-9]*,,g")
      ;;
    /dev/mmcblk*)
      BOOT_DISK=$(echo $BOOT_PART | sed -e "s,p[0-9]*,,g")
      ;;
  esac
fi

# mount $BOOT_ROOT r/w
  mount -o remount,rw $BOOT_ROOT

# update device tree
  for all_dtb in $BOOT_ROOT/*.dtb; do
    dtb=$(basename $all_dtb)
    if [ -f $SYSTEM_ROOT/usr/share/bootloader/$dtb ]; then
      echo -n "Updating $dtb... "
      cp -p $SYSTEM_ROOT/usr/share/bootloader/$dtb $BOOT_ROOT
      echo "done"
    fi
  done

# update bootloader
  if [ -f $SYSTEM_ROOT/usr/share/bootloader/bl1.bin ]; then
    echo -n "Updating bl1.bin... "
    dd if=$SYSTEM_ROOT/usr/share/bootloader/bl1.bin of=$BOOT_DISK seek=1 conv=fsync &>/dev/null
    echo "done"
  fi
  if [ -f $SYSTEM_ROOT/usr/share/bootloader/bl2.bin ]; then
    echo -n "Updating bl2.bin... "
    dd if=$SYSTEM_ROOT/usr/share/bootloader/bl2.bin of=$BOOT_DISK seek=31 conv=fsync &>/dev/null
    echo "done"
  fi
  if [ -f $SYSTEM_ROOT/usr/share/bootloader/u-boot.bin ]; then
    echo -n "Updating u-boot.bin... "
    dd if=$SYSTEM_ROOT/usr/share/bootloader/u-boot.bin of=$BOOT_DISK seek=63 conv=fsync &>/dev/null
    echo "done"
  fi
  if [ -f $SYSTEM_ROOT/usr/share/bootloader/tzsw.bin ]; then
    echo -n "Updating tzsw.bin... "
    dd if=$SYSTEM_ROOT/usr/share/bootloader/tzsw.bin of=$BOOT_DISK seek=1503 conv=fsync &>/dev/null
    echo "done"
  fi

# mount $BOOT_ROOT r/o
  sync
  mount -o remount,ro $BOOT_ROOT
