# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="2ec2f7fd753798a19202fbdebe51948ecd9fb2d5"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"
GET_HANDLER_SUPPORT="git"

post_unpack() {
  rm $PKG_BUILD/configure $PKG_BUILD/Makefile
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/autoconfig
  cp -r * $INSTALL/usr/share/retroarch/autoconfig
}

post_makeinstall_target () {
  cp -r $PKG_DIR/config/* $INSTALL/usr/share/retroarch/autoconfig
}
