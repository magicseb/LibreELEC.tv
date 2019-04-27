# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lm-sensors"
PKG_VERSION="3-5-0"
PKG_SHA256="f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0"
PKG_ARCH="arm x86_64"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/lm-sensors/lm-sensors"
PKG_URL="https://github.com/${PKG_NAME}/${PKG_NAME}/archive/V${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The lm-sensors package, version 3, provides user-space support for the hardware monitoring drivers in Linux 2.6.5 and later."

PKG_MAKEINSTALL_OPTS_TARGET="PREFIX=/usr"

pre_configure_target() {
  PKG_MAKE_OPTS_TARGET="PREFIX=/usr CC=$CC AR=$AR"

  export CFLAGS="$TARGET_CFLAGS"
  export CPPFLAGS="$TARGET_CPPFLAGS"
}
