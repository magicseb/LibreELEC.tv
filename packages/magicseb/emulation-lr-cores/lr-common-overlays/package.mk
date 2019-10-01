# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-common-overlays"
PKG_VERSION="4d700116edf178452831f99a5173f88559f1b8ec"
PKG_SHA256="8e8af74f5ab133f062b8f87316e9c0685950e7afd239250d6aa560269b0ef428"
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
