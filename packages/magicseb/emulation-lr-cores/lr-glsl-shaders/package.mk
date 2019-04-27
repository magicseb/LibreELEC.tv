# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-glsl-shaders"
PKG_VERSION="9f1257d16a5952870de0b2d332e5c4d4aab1f265"
PKG_SHA256="8609b59f368709d08896db7690aee53a0535124ab5bfd289c541c60bec2d8145"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/glsl-shaders"
PKG_URL="https://github.com/libretro/glsl-shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="GLSL shaders converted by hand from libretro's common-shaders repo."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="$INSTALL/usr/share/retroarch/shaders/GLSL-Shaders"
}
