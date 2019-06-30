# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-stella"
PKG_VERSION="7cc0c44b08542d8e0efcd5361c680959b39f29a6"
PKG_SHA256="c8805f96102ce260e50a743e0791382dd98f054c268944a1e770be19f8305c81"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/stella2014-libretro"
PKG_URL="https://github.com/libretro/stella2014-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of Stella to libretro."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="stella2014_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
