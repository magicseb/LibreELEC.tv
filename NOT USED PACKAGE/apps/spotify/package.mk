# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) Originally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="spotify"
PKG_VERSION="latest"
PKG_ARCH="x86_64"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.spotify.com"
PKG_DEPENDS_TARGET="toolchain gtk2 libX11 libcurl-gnutls freetype zlib"
PKG_LONGDESC="A proprietary music streaming service"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # creating directories  
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/spotify

  # copy scripts, config files & resources
  cp $PKG_DIR/files/icon.png $INSTALL/usr/config/spotify/
  cp $PKG_DIR/scripts/spotify $INSTALL/usr/bin/
}
