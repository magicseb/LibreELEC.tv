# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-core-info"
PKG_VERSION="eef4f207b23132cf9f7b324e5f4eaf556cc50181"
PKG_SHA256="c218570c5e8b4f3bbf170d8711487f2f32af0a8ac87bc9b930384349aabe1335"
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

