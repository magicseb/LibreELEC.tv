# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dosbox"
PKG_VERSION="2aa0bd13b372956b2fe989ca5e9d8e45f75fb44d"
PKG_SHA256="15e31cfdb251fae1f2096030227327dcae781640a32cb5f34c23764fb9c7bb75"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/dosbox-libretro"
PKG_URL="https://github.com/libretro/dosbox-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of DOSBox (upstream) to the libretro API."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="+pic"

PKG_LIBNAME="dosbox_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
