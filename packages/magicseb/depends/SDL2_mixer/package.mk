# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL2_mixer"
PKG_VERSION="2.0.4"
PKG_SHA256="b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git freetype"
PKG_LONGDESC="This is a sample library which allows you to use sounds in your SDL applications"
PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--with-freetype-prefix=$SYSROOT_PREFIX/usr"

if [ ! "${DISPLAYSERVER}" = "x11" ]; then
  PKG_CONFIGURE_OPTS_TARGET+=" --without-x"
fi
