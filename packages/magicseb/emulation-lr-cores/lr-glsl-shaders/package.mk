# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-glsl-shaders"
PKG_VERSION="faa1226fbee3f37f8c26b73978e5296624744cdb"
PKG_SHA256="133fda45b65782e9d00a231d92642b5fdbb2709fbbccefe39ebf79d3093e4311"
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
