# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="01891a83e99c2999a997e9c5724d72bc6ce61e0c"
PKG_SHA256="32a5d9bb5f7857d129abacc80898ed49d84928cd6dd47da5bba7e571356f41db"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig.git"
PKG_URL="https://github.com/libretro/retroarch-joypad-autoconfig/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_TOOLCHAIN="manual"

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
