# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-crocods"
PKG_VERSION="fbb619f745c3ff470c9e491a18418d743b93789c"
PKG_SHA256="51854e6f6cc6d81d93bad4f92b5b7641352d719ace5e33795fd22864b141b8d8"
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
