# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-tyrquake"
PKG_VERSION="60dd67f423a8289b6d88e878d4aab09b5d6ebe15"
PKG_SHA256="83e7138cfa10e8168f911feca16d9196faf79a601243f41208074540ff5d64ea"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/tyrquake"
PKG_URL="https://github.com/libretro/tyrquake/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Libretro port of Tyrquake (Quake 1 engine)"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="tyrquake_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"


pre_configure_target() {
 
  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi"
        CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                        -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                        -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

        ;;
     RPi3)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
        CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/interface/vcos/pthreads \
                        -I$SYSROOT_PREFIX/usr/include/interface/vmcs_host/linux"

        ;;
    RPi4)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi3"

        ;;
    esac
  fi
}


makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/lib/libretro

  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
