# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="tigervnc-system"
PKG_VERSION="1.9.0"
PKG_SHA256="f15ced8500ec56356c3bf271f52e58ed83729118361c7103eab64a618441f740"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="http://www.tigervnc.org"
PKG_URL="https://github.com/TigerVNC/tigervnc/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain libX11 libXdamage libXext libXtst zlib libjpeg-turbo"
PKG_LONGDESC="TigerVNC server"

PKG_CMAKE_OPTS_TARGET="-DBUILD_VIEWER=off \
                       -Wno-dev"

post_makeinstall_target() {
  rm $INSTALL/usr/bin/vncserver
  rm $INSTALL/usr/bin/vncconfig
  mkdir -p $INSTALL/usr/config/tigervnc
  cp $PKG_DIR/config/vncpasswd $INSTALL/usr/config/tigervnc/
}
