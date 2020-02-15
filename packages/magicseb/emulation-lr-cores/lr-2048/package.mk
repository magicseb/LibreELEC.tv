# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-2048"
PKG_VERSION="c5e0df2a74c4e25657095db114d62c2cefac9f52"
PKG_SHA256="cb5616e0984bdf364c7537c998e7341d95f00616aacf23cf8b3a59e6bb1352ba"
PKG_LICENSE="Public domain"
PKG_SITE="https://github.com/libretro/libretro-2048"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of 2048 puzzle game to the libretro API."
PKG_TOOLCHAIN="make"
GET_HANDLER_SUPPORT="git"

PKG_LIBNAME="2048_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/retroarch/playlists
  mkdir -p $INSTALL/usr/lib/libretro

  #create Retroarch Playlist
  cp $PKG_DIR/files/* $INSTALL/usr/config/retroarch/playlists
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
