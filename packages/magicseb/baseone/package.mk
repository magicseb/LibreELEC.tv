# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="baseone"
PKG_VERSION="1.0"
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="oem"
PKG_LONGDESC="BASE PACKAGE: Metapackage for various OEM packages"

PKG_TOOLCHAIN="manual"

makeinstall_target() {

  # Create dirs
  mkdir -p $INSTALL
  mkdir -p $INSTALL/usr/bin
  # Copy oem config files & scripts
  cp -PR $PKG_DIR/files/common/usr/bin/*   $INSTALL/usr/bin
  cp -PR $PKG_DIR/files/common/*   $INSTALL
  cp -PR $PKG_DIR/files/$PROJECT/* $INSTALL
}
