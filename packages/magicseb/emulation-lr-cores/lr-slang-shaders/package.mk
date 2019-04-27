# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-slang-shaders"
PKG_VERSION="04081a285bde40998e8dfff99070f0d0607abff2"
PKG_SHA256="b2aff0d405fcc11c99efa7529780422f496e81d37004e62bc61bb6b267fe035a"
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
