# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-puae"
PKG_VERSION="50fb925908ac0a76c0a87d931d8a6a8de6c7874b"
PKG_SHA256="1d78dddcd9d2a0ca566b81acf681ab6b7da59502cad491dfd5b8a65218062ad4"
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
