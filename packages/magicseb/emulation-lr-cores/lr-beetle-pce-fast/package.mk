# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-pce-fast"
PKG_VERSION="c245b687e44ec52cb2154cbfa26b80c0f8d80f1a"
PKG_SHA256="07b85d7d180ac68918cbaeac6b2ef1fad612b44ea3ba1ba083d334e8ea7f4b59"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-pce-fast-libretro"
PKG_URL="https://github.com/libretro/beetle-pce-fast-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Standalone port of Mednafen PCE Fast to libretro."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mednafen_pce_fast_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
