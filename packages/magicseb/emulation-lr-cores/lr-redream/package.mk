# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-redream"
PKG_VERSION="ffb7302245ff40515cb9f0f0b0e233a4b39342d3"
PKG_SHA256=""
PKG_REV="1"
PKG_ARCH="arm i386 x86_64"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/inolen/redream"
PKG_URL="https://github.com/inolen/redream.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Work In Progress SEGA Dreamcast emulator"
PKG_LONGDESC="Work In Progress SEGA Dreamcast emulator"
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

make_target() {
  cd $PKG_BUILD/deps/libretro
  if [ "$ARCH" == "arm" ]; then
    make CC=$CC CXX=$CXX FORCE_GLES=1 WITH_DYNAREC=arm HAVE_NEON=1
  else
    make
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp redream_libretro.so $INSTALL/usr/lib/libretro/
}
