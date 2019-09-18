# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-hatari"
PKG_VERSION="ecfc143efce6e068a4b506dfdaf6516d3c268372"
PKG_SHA256="f021698321e7c4cef7634cd33be7e924ddc1165bba6dd2ab534469bace74dcd3"
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
