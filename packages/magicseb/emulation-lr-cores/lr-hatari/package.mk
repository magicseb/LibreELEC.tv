# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-hatari"
PKG_VERSION="3fdaff4dce22c6a328fce932dc6ebcb30ff76dff"
PKG_SHA256="3df972f2ad5f46ded6588dd1b67d153681309ef77714314b629ab5406dd333ae"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/hatari"
PKG_URL="https://github.com/libretro/hatari/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="New rebasing of Hatari based on Mercurial upstream"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="../hatari_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET=" -C .. -f Makefile.libretro"

pre_configure_target() {
 if [ "$ARCH" == "arm" ]; then
    CFLAGS="$CFLAGS -DNO_ASM -DARM -D__arm__ -DARM_ASM -DNOSSE -DARM_HARDFP"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
