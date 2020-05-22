# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-common-overlays"
PKG_VERSION="e44d7ac8294cfd8ac0ca7a08aa2361730227603d"
PKG_SHA256="416d23a485273560533e9dfc0b3c6932d192baa416012fe963fd34f103741c8c"
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
