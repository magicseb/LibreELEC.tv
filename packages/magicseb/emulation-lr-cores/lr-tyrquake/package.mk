# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-tyrquake"
PKG_VERSION="0a8b5e586b9e819aa75568996d10c5e3f4164d2c"
PKG_SHA256="48a14d2e8c6836c812e97bf90c5c77229ef8e4eeaf17eec07417e924926fe781"
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
