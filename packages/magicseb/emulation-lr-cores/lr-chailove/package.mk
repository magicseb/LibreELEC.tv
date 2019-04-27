# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-chailove"
PKG_VERSION="d57052ee94809254bc31673025e3afef8b8b3bab" # v0.32.0
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-chailove"
PKG_URL="https://github.com/libretro/libretro-chailove.git"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="ChaiLove is an awesome framework you can use to make 2D games in ChaiScript."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="chailove_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

configure_target() {
  cd $PKG_BUILD
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
