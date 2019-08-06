# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-atari800"
PKG_VERSION="43287de64e4dfe94bffae98313b4356a3a725702"
PKG_SHA256="2b72b166c3f2e9308b3106faa6927f9958820278f712d860fd6351cb4585eefc"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-atari800"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="WIP Libretro port of Atari800 emulator version 3.1.0"
PKG_TOOLCHAIN="make"
GET_HANDLER_SUPPORT="git"

PKG_LIBNAME="atari800_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
