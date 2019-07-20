# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-gambatte"
PKG_VERSION="b4690512592fc3a6bc5948f62af6e85c13f5abf7"
PKG_SHA256="0d45666cf143ae963100fa962a4780f3b63d9fc4c527bba9ca16045b76a242e6"
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
