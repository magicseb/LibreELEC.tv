# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-4do"
PKG_VERSION="d7d21936f0c81f1541f2f7625ed2d9184c07e92e"
PKG_ARCH="any"
PKG_LICENSE="LGPL with additional notes"
PKG_SITE="https://github.com/libretro/4do-libretro"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of 4DO/libfreedo to libretro."
PKG_LONGDESC="Port of 4DO/libfreedo to libretro."
GET_HANDLER_SUPPORT="git"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make CC=$CC CXX=$CXX AR=$AR
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp opera_libretro.so $INSTALL/usr/lib/libretro/
}
