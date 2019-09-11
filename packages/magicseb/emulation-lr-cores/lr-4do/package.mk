# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present magicseb (https://github.com/magicseb)

PKG_NAME="lr-4do"
PKG_VERSION="b6ad4bc8548f2f3792cd929ccf26d9078b73a1c0"
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
  cp 4do_libretro.so $INSTALL/usr/lib/libretro/
}
