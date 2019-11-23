# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-beetle-lynx"
PKG_VERSION="fe8dc90931de95b90dc1ff76681a95910511f087"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-lynx-libretro"
PKG_URL="https://github.com/libretro/beetle-lynx-libretro.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro implementation of Mednafen Lynx"
PKG_LONGDESC="libretro implementation of Mednafen Lynx"
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_lynx_libretro.so $INSTALL/usr/lib/libretro/
}
