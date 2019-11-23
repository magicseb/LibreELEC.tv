# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-bnes"
PKG_VERSION="8e26e89a93bef8eb8992d1921b539dce1792660a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/bnes-libretro"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="libretro implementation of bNES/higan. (Nintendo Entertainment System)"
PKG_LONGDESC="libretro implementation of bNES/higan. (Nintendo Entertainment System)"
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp bnes_libretro.so $INSTALL/usr/lib/libretro/bnes_libretro.so
}
