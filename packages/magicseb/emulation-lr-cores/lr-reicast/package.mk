# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-reicast"
PKG_VERSION="2f8be6d8b68ad739e6cecd02fc7ab58781a10112"
PKG_SHA256="4efd8b99971798f219ed343a61c40bbd2962638abce38f6e66fe4a0b37f6b7ec"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/reicast-emulator"
PKG_URL="https://github.com/libretro/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="reicast_libretro.so"
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
    RPi)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi"
      ;;
    RPi2)
      PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
      ;;
    Rockchip)
      PKG_MAKE_OPTS_TARGET+=" platform=rockpro64"
      ;;
    Generic)
      PKG_MAKE_OPTS_TARGET+=" AS=${AS} CC_AS=${AS} HAVE_OIT=1"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
