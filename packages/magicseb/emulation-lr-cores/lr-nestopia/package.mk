# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-nestopia"
PKG_VERSION="cbe14441d666a9cfad6f0aa3325ea23502dce123"
PKG_SHA256="639032c54c0e18b25798a9a712d0c071def3d97309e861410c44eee3c7d1085e"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/nestopia"
PKG_URL="https://github.com/libretro/nestopia/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="This project is a fork of the original Nestopia source code, plus the Linux port. The purpose of the project is to enhance the original, and ensure it continues to work on modern operating systems."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="nestopia_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C libretro GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "${PROJECT}" = "RPi" ]; then
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
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
