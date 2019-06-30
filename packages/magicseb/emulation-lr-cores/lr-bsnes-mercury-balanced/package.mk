# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-bsnes-mercury-balanced"
PKG_VERSION="e1cef8b467cb97858d403896302ca0babb4ec1f1"
PKG_SHA256="d087dd697bc5e22b54e33e736d9d59993d34221d0aa65664c14361c0fa416fcc"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/bsnes-mercury"
PKG_URL="https://github.com/libretro/bsnes-mercury/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Fork of bsnes with various performance improvements."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="bsnes_mercury_balanced_libretro.so"
PKG_LIBPATH="out/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="profile=balanced GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
