# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-flycast"
PKG_VERSION="bbf58889c2c231edee41d96fde5de789157fc9c0"
PKG_SHA256="9f9c7af7fecefc70046e8de914cfd36a38fa21a6cca91a660d68fb166ec71305"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/flycast"
PKG_URL="https://github.com/libretro/flycast/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="flycast_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="HAVE_OPENMP=0 GIT_VERSION=${PKG_VERSION:0:7} WITH_DYNAREC=$ARCH"

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
  export BUILD_SYSROOT=$SYSROOT_PREFIX

  if [ "$OPENGLES_SUPPORT" = "yes" ]; then
    PKG_MAKE_OPTS_TARGET+=" FORCE_GLES=1"
  fi

  case $PROJECT in
    Amlogic_Legacy)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi"
      ;;
    RPi2)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
      ;;
    RPi3)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
      ;;
    Rockchip)
      PKG_MAKE_OPTS_TARGET+=" platform=rockpro64"
      ;;
    Generic)
      PKG_MAKE_OPTS_TARGET+=" AS=${AS} CC_AS=${AS} HAVE_OIT=1"
      ;;
  esac

case $DEVICE in
    RPi2)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
      ;;
    RPi3)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi3"
      ;;
    RPi4)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
