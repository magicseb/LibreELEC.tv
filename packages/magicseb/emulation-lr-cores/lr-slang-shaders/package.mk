# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-slang-shaders"
PKG_VERSION="506b186ec37fb3f98229c99187693e120d43fe33"
PKG_SHA256="ed751d4c5282671f4524a9ab287daec5fc988c05648fc08a15ccb392bb024aec"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/slang-shaders"
PKG_URL="https://github.com/libretro/slang-shaders/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Vulkan GLSL RetroArch shader system"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="$INSTALL/usr/share/retroarch/shaders/Vulkan-Shaders"
}
