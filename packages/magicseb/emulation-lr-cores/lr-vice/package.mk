# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-vice"
PKG_VERSION="063845212575153ceb0e2a7740bb25966b92afb1"
PKG_SHA256="a87215c27e457ccdfde074feac1d1d01d7d4e39eea050fb767e2cb164ef6ec47"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vice-libretro"
PKG_URL="https://github.com/libretro/vice-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator version 3.0 LIBRETRO WIP"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="vice_x64_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
