# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-stella"
PKG_VERSION="722744c11b36c1614740b6060d0bdb187660ffac"
PKG_SHA256="826ebdcc24ae6e4c70e0118bf3e9165135a05e0abc0fda4ca28c4fc76b74a6d8"
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
