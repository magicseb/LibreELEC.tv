# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="mesa-demos-system"
PKG_VERSION="317f67fe5e75c685330d536f158acf6260b473d1"
PKG_SHA256="be6acbe9a33f745eae1bfc4a57673ce770f257315b8e2e6cb801bbe630a85e33"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.mesa3d.org/"
PKG_URL="https://cgit.freedesktop.org/mesa/demos/snapshot/$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libX11 mesa glu glew"
PKG_LONGDESC="Mesa 3D demos - installed are the well known glxinfo and glxgears."
PKG_TOOLCHAIN="autotools"

PKG_CONFIGURE_OPTS_TARGET="--without-glut"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp src/xdemos/glxinfo $INSTALL/usr/bin
  cp src/xdemos/glxgears $INSTALL/usr/bin
}

