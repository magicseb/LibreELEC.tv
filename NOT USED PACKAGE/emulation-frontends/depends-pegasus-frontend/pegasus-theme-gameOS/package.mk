# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pegasus-theme-gameOS"
PKG_VERSION="dc3c87e4662f386a6c27bc438e74676a53503c3a" # v0.5+
PKG_SHA256="8c4674118be35ecd9411c7da0264c06905d11e2889900f681c336155ee1c110c"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/PlayingKarrde/gameOS"
PKG_URL="https://github.com/PlayingKarrde/gameOS/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="gameOS theme for Pegasus Frontend"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/pegasus-frontend/themes/gameOS
  cp -r *  $INSTALL/usr/share/pegasus-frontend/themes/gameOS
}
