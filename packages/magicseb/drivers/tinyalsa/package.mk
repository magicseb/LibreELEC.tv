# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="tinyalsa"
PKG_VERSION="1.1.1"
PKG_SHA256="d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1"
PKG_LICENSE="AOSP"
PKG_SITE="https://github.com/tinyalsa/tinyalsa"
PKG_URL="https://github.com/tinyalsa/tinyalsa/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="TinyALSA is a small library to interface with ALSA in the Linux kernel."

make_target() {
  make CC=$CC LD=$CC AR=$AR
}
