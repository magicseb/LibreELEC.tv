# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2016"
PKG_VERSION="ea4c1ffa75eb3fb0096158b71706b8b84d86d12c"
PKG_SHA256="71916b18794d854a420cf317ceb95d5f1dad7a142bf7717d5cdab4ff1bf991f7"
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
