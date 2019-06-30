# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-scummvm"
PKG_VERSION="d57fe3bdfb9c9557962a3b23bafb4dd034373606"
PKG_SHA256="ef312cb2326d89467cd295ae5ff9dcf4bc548a9ed4954a163999ee91cea0cd58"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/scummvm"
PKG_URL="https://github.com/libretro/scummvm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="ScummVM is an interpreter for point-and-click adventure games that can be used as a libretro core."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="scummvm_libretro.so"
PKG_LIBPATH="backends/platform/libretro/build/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C backends/platform/libretro/build/ GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  cd $PKG_BUILD
  CXXFLAGS+=" -DHAVE_POSIX_MEMALIGN=1"
  export LD="$CC"
  export AR+=" cru"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
