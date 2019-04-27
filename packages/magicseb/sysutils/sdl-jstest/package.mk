# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="sdl-jstest"
PKG_VERSION="53b89cc2" #v0.2.1
PKG_LICENSE="GPLv2"
PKG_SITE="https://gitlab.com/sdl-jstest/sdl-jstest"
PKG_URL="https://gitlab.com/sdl-jstest/sdl-jstest.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git SDL_GameControllerDB ncurses"
PKG_LONGDESC="sdl2-jstest are simple programs that lets you find out how many joysticks SDL2 detects on your system, how many axes, buttons, hats and balls they have each."
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SDL_JSTEST=off"

post_makeinstall_target() {
  mv $INSTALL/usr/bin/sdl2-jstest $INSTALL/usr/bin/sdl2-jstest.bin
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  ln -sf /usr/bin/sdl2-jstest $INSTALL/usr/bin/sdl-jstest
}


