# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-puae"
PKG_VERSION="8333daad83b8f917a31c55939e2440aa8670863a"
PKG_SHA256="82e7fa78b1c32bcebf89b9495e1b014e7019f4b238cdc327962c0ab7138f7e04"
PKG_LICENSE="GPLv3"
PKG_ARCH="arm i386 x86_64"
PKG_SITE="https://github.com/libretro/libretro-uae"
PKG_URL="https://github.com/libretro/libretro-uae/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="WIP libretro port of UAE (P-UAE and libco) Expect bugs"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="puae_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_configure_target() {
 if [ "$ARCH" == "arm" ]; then
    CFLAGS="$CFLAGS -DARM -marm"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp -v $PKG_LIBPATH ${INSTALL}/usr/lib/libretro/
}
