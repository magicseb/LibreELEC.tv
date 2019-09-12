# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dosbox"
PKG_VERSION="e4ed503b14ed59d5d745396ef1cc7d52cf912328"
PKG_SHA256="f13b4235762db542a2ab0ae62a048d30ef71062af5dea1662864e27956eea2c9"
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
