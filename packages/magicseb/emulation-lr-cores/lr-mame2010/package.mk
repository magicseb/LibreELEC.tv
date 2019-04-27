# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2010"
PKG_VERSION="c87309dab5fc8db292e31737fcd1754de1fbae6a"
PKG_SHA256="6f442b362b5929f8b762f289a874e2011902617efdcea4bfc2fc2a54836973ec"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2010-libretro"
PKG_URL="https://github.com/libretro/mame2010-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="Late 2010 version of MAME (0.139) for libretro. Compatible with MAME 0.139 romsets."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mame2010_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fpermissive"
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  export LD="$CXX"

  case $TARGET_CPU in
    arm1176jzf-s)
      PKG_MAKE_OPTS_TARGET+=" platform=armv6-hardfloat-$TARGET_CPU"
      ;;
    cortex-a7|cortex-a9)
      PKG_MAKE_OPTS_TARGET+=" platform=armv7-neon-hardfloat-$TARGET_CPU"
      ;;
    *cortex-a53|cortex-a17)
      PKG_MAKE_OPTS_TARGET+=" platform=armv7-neon-hardfloat-cortex-a9"
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
