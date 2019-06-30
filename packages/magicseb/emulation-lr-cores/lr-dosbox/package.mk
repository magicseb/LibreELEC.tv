# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dosbox"
PKG_VERSION="410746e07668314b880098b4dc8808a7855d02f3"
PKG_SHA256="c52f195a46fa47e0536809f4745fb8f9c3dff2ecf19097342fc3cae9b423135b"
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
