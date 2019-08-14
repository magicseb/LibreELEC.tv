# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-assets"
PKG_VERSION="5aa0c9f9edb33181d34d1ca32a65d417e3ad1dfd"
PKG_SHA256="99cc62bc9769afecbc2a94ce221554d6a1e53ca39633fede758325ee9cddb47e"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-assets"
PKG_URL="https://github.com/libretro/retroarch-assets/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch assets. Background and icon themes for the menu drivers."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  cd ../
  rm -rf .$TARGET_NAME
}

makeinstall_target() {
  make install DESTDIR=$INSTALL PREFIX=/usr
}

post_makeinstall_target() {
  mv $INSTALL/usr/share/libretro $INSTALL/usr/share/retroarch
}
