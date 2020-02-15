# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)


PKG_NAME="lr-beetle-ngp"
PKG_VERSION="6f15532b6ad17a2d5eb9dc8241d6af62416e796b"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-ngp-libretro"
PKG_URL="https://github.com/libretro/beetle-ngp-libretro.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro implementation of Mednafen Neo Geo Pocket."
PKG_LONGDESC="libretro implementation of Mednafen Neo Geo Pocket."
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"


makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_ngp_libretro.so $INSTALL/usr/lib/libretro/
}
