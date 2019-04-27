# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-es2-simple"
PKG_VERSION="d44e3c5ba2d1cbdc706e2c25822f6d8f27e64aaf"
PKG_SHA256="d5fd8ca6ef4f92a0b17129e8c33c3199c2b18b3035f8cf93dd05f60b57394a92"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/mmatyas/pegasus-theme-es2-simple"
PKG_URL="https://github.com/mmatyas/pegasus-theme-es2-simple/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="ES2 Simple theme for Pegasus"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
  cp -r *  $INSTALL/usr/share/pegasus-frontend/themes/pegasus-theme-es2-simple
}
