# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-bsnes-mercury-accuracy"
PKG_VERSION="4e221df676ffc7b46d083cf2ae100131eabe5076"
PKG_SHA256="ad493381c5736e521996b850918e0df7c09124c71d98fac6a1e04c57830dade4"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes-mercury"
PKG_URL="https://github.com/libretro/bsnes-mercury/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Fork of bsnes with various performance improvements."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="bsnes_mercury_accuracy_libretro.so"
PKG_LIBPATH="out/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="profile=accuracy GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
