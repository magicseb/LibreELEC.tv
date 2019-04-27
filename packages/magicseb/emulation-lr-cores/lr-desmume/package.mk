# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-desmume"
PKG_VERSION="b2da53a754040d0b566f46b40760bf11bc848df1"
PKG_SHA256="92d0b5dc7182e54f9105cb77aefaee755eb8749601af2fe7c82957960ee79d71"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc libpcap"
PKG_LONGDESC="DeSmuME is a Nintendo DS emulator"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="desmume_libretro.so"
PKG_LIBPATH="desmume/src/frontend/libretro/$PKG_LIBNAME"

# Disable OpenGL if not supported
if [ ! $OPENGL_SUPPORT = "yes" ]; then
  PKG_PATCH_DIRS="no-opengl"
fi

PKG_MAKE_OPTS_TARGET="-C desmume/src/frontend/libretro -f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

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

pre_configure_target() {
  case $TARGET_CPU in
    arm1176jzf-s)
      PKG_MAKE_OPTS_TARGET+=" platform=armv6-hardfloat-$TARGET_CPU"
      ;;
    cortex-a7|cortex-a9|cortex-a53|cortex-a72.cortex-a53)
      PKG_MAKE_OPTS_TARGET+=" platform=armv7-neon-hardfloat-$TARGET_CPU"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
