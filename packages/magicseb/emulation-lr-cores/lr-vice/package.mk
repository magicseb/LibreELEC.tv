# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-vice"
PKG_VERSION="f4f2ca45c08aff5ca0757d5fd7d60ff518f5cc7a"
#PKG_SHA256="ad46aa3f03f0dfddb6673c9aa813d26a80696d04a8131de326ca4f2c7464f212"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vice-libretro"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator version 3.0 LIBRETRO WIP"
PKG_TOOLCHAIN="make"
GET_HANDLER_SUPPORT="git"

PKG_LIBNAME="vice_x64_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
