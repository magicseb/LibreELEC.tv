# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-crocods"
PKG_VERSION="8d8443cd68093dab195e38973374159c8daefa96"
PKG_SHA256="e37d8aa1701957dd54b39673c88d25b334177b8de7ff57463255b2e036600352"
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
