# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rockchip-autoscript"
PKG_VERSION="0.1"
PKG_LICENSE="GPL"
PKG_DEPENDS_TARGET="toolchain"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/instboot
  cp -a $PKG_DIR/instboot/* $INSTALL/instboot
}
