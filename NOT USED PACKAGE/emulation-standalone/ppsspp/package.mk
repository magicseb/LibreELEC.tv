# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="ppsspp"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/hrydgard/ppsspp"
PKG_URL="https://github.com/hrydgard/ppsspp.git"
PKG_DEPENDS_TARGET="toolchain linux glibc SDL2-git zlib ffmpeg bzip2 openssl speex"
PKG_LONGDESC="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
GET_HANDLER_SUPPORT="git"

if [ "${PROJECT}" = "Amlogic_Legacy" ]; then
  PKG_VERSION="74d87fa2b4a3c943c1df09cc26a8c70b1335fd30" #v1.7.5
else
  PKG_VERSION="d6d6dbb772ad71ced8ffb2f69f9e6e2af1b10414" #v1.8.0
fi

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

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DUSE_SYSTEM_FFMPEG=ON"

  if [ "${ARCH}" = "arm" ] && [ ! "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARMV7=ON"
  elif [ "${TARGET_CPU}" = "arm1176jzf-s" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DARM=ON"
  fi

  if [ "${OPENGLES_SUPPORT}" = "yes" ] && [ ! "$PROJECT" = "Rockchip" ] ; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_FBDEV=ON \
                             -DUSING_EGL=ON \
                             -DUSING_GLES2=ON"
  fi

  if [ "$PROJECT" = "Rockchip" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_FBDEV=OFF \
                             -DUSING_EGL=OFF \
                             -DUSING_GLES2=ON"
  fi


  if [ "${DISPLAYSERVER}" = "x11" ] && [ "${VULKAN_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_X11_VULKAN=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DUSING_X11_VULKAN=OFF"
  fi
}

pre_make_target() {
  # fix cross compiling
  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find $PKG_BUILD -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/share/PPSSPP
  mkdir -p $INSTALL/usr/config/ppsspp/PSP/SYSTEM

  # Install assets & binary
  cp -r assets $INSTALL/usr/share/PPSSPP
  cp PPSSPPSDL $INSTALL/usr/share/PPSSPP

  # Install scripts
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin

  # Install config
  cp $PKG_DIR/config/* $INSTALL/usr/config/ppsspp/PSP/SYSTEM
  if [ "${PROJECT}" = "Generic" ]; then
    sed -e "s/FullScreen = True/FullScreen = False/" -i ${INSTALL}/usr/config/ppsspp/PSP/SYSTEM/ppsspp.ini
  fi
}
