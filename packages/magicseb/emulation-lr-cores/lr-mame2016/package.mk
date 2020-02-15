# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2016"
PKG_VERSION="02987af9b81a9c3294af8fb9d5a34f9826a2cf4d"
PKG_SHA256="d09ce628901f8b19417f05a84aa7cb1bc2b567b05b0de2bb425451d62f897507"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2016-libretro"
PKG_URL="https://github.com/libretro/mame2016-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Late 2016 version of MAME (0.174) for libretro. Compatible with MAME 0.174 romsets."
PKG_TOOLCHAIN="make"
PKG_BUILD_FLAGS="-gold"

PKG_LIBNAME="mamearcade2016_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

make_target() {
  PTR64="0"
  NOASM="0"

  if [ "$ARCH" = "arm" ]; then
    NOASM="1"
  elif [ "$ARCH" = "x86_64" ]; then
    PTR64="1"
  fi

  make REGENIE=1 VERBOSE=1 NOWERROR=1 PYTHON_EXECUTABLE=python2 CONFIG=libretro \
       LIBRETRO_OS="unix" ARCH="" PROJECT="" LIBRETRO_CPU="$ARCH" DISTRO="debian-stable" \
       CROSS_BUILD="1" OVERRIDE_CC="$CC" OVERRIDE_CXX="$CXX" \
       PTR64="$PTR64" TARGET="mame" \
       SUBTARGET="arcade" PLATFORM="$ARCH" RETRO=1 OSD="retro" GIT_VERSION=${PKG_VERSION:0:7}
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/mame2016_libretro.so
}
