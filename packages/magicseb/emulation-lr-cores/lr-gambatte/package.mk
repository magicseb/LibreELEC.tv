# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-gambatte"
PKG_VERSION="708424d7b48f4772690b0e24574b9ab7b43b2f52"
PKG_SHA256="696495e0a9985c658ee9ca554e2e70dec33626ff4e847c00e4196a58a5087e39"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/gambatte-libretro"
PKG_URL="https://github.com/libretro/gambatte-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Gambatte is an accuracy-focused, open-source, cross-platform Game Boy Color emulator written in C++."

PKG_LIBNAME="gambatte_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"


pre_configure_target() {
  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
      RPi3)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
        ;;
      RPi4)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
        ;;
    esac
  fi
}
makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
