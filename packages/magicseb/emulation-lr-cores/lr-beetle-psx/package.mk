# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-beetle-psx"
PKG_VERSION="c3581e36dd9b3a56bd4a5001ba56bae772316e8b"
PKG_SHA256="0c9fb379df328d1e44dc7a50f3e696a1ec14144a4bc6082205d21245f812bbe3"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/beetle-psx-libretro"
PKG_URL="https://github.com/libretro/beetle-psx-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Standalone port/fork of Mednafen PSX to the Libretro API."

PKG_LIBNAME="mednafen_psx_libretro.so"
PKG_LIBPATH="${PKG_LIBNAME}"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi
}

make_target() {
  make GIT_VERSION=${PKG_VERSION:0:7}

  # Build with OpenGL/Vulkan support if available
  if [ "${OPENGL_SUPPORT}" = "yes" ];then
    mkdir -p tmp
    mv ${PKG_LIBNAME} tmp/
    make clean
    if [ "${VULKAN_SUPPORT}" = "yes" ];then
      make HAVE_HW=1 GIT_VERSION=${PKG_VERSION:0:7}
    else
      make HAVE_OPENGL=1 GIT_VERSION=${PKG_VERSION:0:7}
    fi
    mv tmp/${PKG_LIBNAME} .
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mednafen_psx_*libretro.so $INSTALL/usr/lib/libretro/
}
