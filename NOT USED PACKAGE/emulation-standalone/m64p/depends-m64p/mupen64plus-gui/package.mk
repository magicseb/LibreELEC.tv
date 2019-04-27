# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="mupen64plus-gui"
PKG_VERSION="ebad8c6bae19df3df7ac93f98c83a7498eac2eef"
PKG_SHA256="2d57f2549d4d0a827059f5bbb4be6403c7596056067b072e883bfeaf3ef90ba4"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/m64p/mupen64plus-gui"
PKG_URL="https://github.com/m64p/mupen64plus-gui/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc SDL2-git qt-everywhere p7zip-system libpng zlib"
PKG_LONGDESC="mupen64plus GUI written in Qt5"
PKG_TOOLCHAIN="manual"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

configure_target() {
  export SYSROOT_PREFIX=$SYSROOT_PREFIX
}

make_target() {
  mkdir -p $PKG_BUILD/.${TARGET_NAME}
  cd .${TARGET_NAME}
  qmake ../mupen64plus-gui.pro
  make -j$CONCURRENCY_MAKE_LEVEL
}
