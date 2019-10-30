# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-beetle-pcfx"
PKG_VERSION="7e9a586d75468098cba25f604f545a4162c2f376"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-pcfx-libretro"
PKG_URL="https://github.com/libretro/beetle-pcfx-libretro.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro implementation of Mednafen PC-FX."
PKG_LONGDESC="libretro implementation of Mednafen PC-FX."
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "i386" -o "$ARCH" == "x86_64" ]; then
    make platform=unix CC=$CC CXX=$CXX AR=$AR
  else
    make platform=armv CC=$CC CXX=$CXX AR=$AR
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_pcfx_libretro.so $INSTALL/usr/lib/libretro/
}
