# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-saturn"
PKG_VERSION="1e82c3cfd3c9d39a6d11ae32153eba6461f2b061"
PKG_SHA256="bcae061c52646712b46d88605c22963246e051bd65e7ba82b2bfe18c8fff149b"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/beetle-saturn-libretro"
PKG_URL="https://github.com/libretro/beetle-saturn-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Standalone port of Mednafen Saturn to the libretro API."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mednafen_saturn_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
