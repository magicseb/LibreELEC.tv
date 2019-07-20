# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mame2003-plus"
PKG_VERSION="4d46cff63939ac22408e0d59b6d34a09c146c6c2"
PKG_SHA256="78acdbd0d29626bb10b231b59c6481ff0a78132f726adcd05457aef8ee30f805"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2003-plus-libretro"
PKG_URL="https://github.com/libretro/mame2003-plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mame2003_plus_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "$ARCH" = "arm" ]; then
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
      *)
        PKG_MAKE_OPTS_TARGET+=" platform=armv"
        ;;
    esac
  fi
  export LD="$CC"
}

pre_make_target() {
  # Set skip Disclaimer to enabled
  sed -e "s/\"Skip Disclaimer; disabled|enabled\"/\"Skip Disclaimer; enabled|disabled\"/" -i ${PKG_BUILD}/src/mame2003/mame2003.c
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
