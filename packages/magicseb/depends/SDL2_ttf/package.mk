# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL2_ttf"
PKG_VERSION="2.0.15"
PKG_SHA256="a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype"
PKG_LONGDESC="This is a sample library which allows you to use TrueType fonts in your SDL applications"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--with-freetype-prefix=$SYSROOT_PREFIX/usr"

if [ ! "${DISPLAYSERVER}" = "x11" ]; then
  PKG_CONFIGURE_OPTS_TARGET+=" --without-x"
fi
