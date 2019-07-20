# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-crocods"
PKG_VERSION="a7d1098000376a39d70db171863c8f46da7de07d"
PKG_SHA256="760fb1eab031395b466e699b1ff8be66ba50475de41f49d1af6dde42367cbd0d"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/libretro-crocods"
PKG_URL="https://github.com/libretro/libretro-crocods/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Amstrad CPC emulator"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="crocods_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"


makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp -v $PKG_LIBPATH ${INSTALL}/usr/lib/libretro/
}
