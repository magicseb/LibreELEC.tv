# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-core-info"
PKG_VERSION="f40100cec2f4b4ead971efacca79d289e0fb1cf6"
PKG_SHA256="8be06564267aabf7d8b90e8d6c61a30d1adeadee83ac1115b6bb148d5bcb3f93"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-core-info"
PKG_URL="https://github.com/libretro/libretro-core-info/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Mirror of libretro's core info files"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/*.info $INSTALL/usr/lib/libretro/
}

