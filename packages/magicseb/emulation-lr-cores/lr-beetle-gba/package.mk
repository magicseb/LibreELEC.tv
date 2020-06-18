# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-beetle-gba"
PKG_VERSION="30ee7923a566f95aa0b2dd14fd21ae1074a89fd4"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-gba-libretro"
PKG_URL="https://github.com/libretro/beetle-gba-libretro.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro implementation of Mednafen VBA/GBA. (Game Boy Advance)"
PKG_LONGDESC="libretro implementation of Mednafen VBA/GBA. (Game Boy Advance)"
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_gba_libretro.so $INSTALL/usr/lib/libretro/
}
