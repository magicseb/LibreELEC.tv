# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-common-overlays"
PKG_VERSION="a1f4176ab2ac1d258a4d4fccfce8ab32339dcc68"
PKG_SHA256="580d1f18fb0a54c64b5ad945ae901af030e6b2d66d82120ec1615b8839521a80"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/common-overlays"
PKG_URL="https://github.com/libretro/common-overlays/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Collection of overlay files for use with libretro frontends, such as RetroArch."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/overlay
  cp -r $PKG_BUILD/borders $INSTALL/usr/share/retroarch/overlay
}
