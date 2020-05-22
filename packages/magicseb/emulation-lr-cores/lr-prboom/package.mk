# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-prboom"
PKG_VERSION="0d38f5da0109c33d195d6eb9f92cd97bd08e3311"
PKG_SHA256="c73993b7271ac1b747fa74a60d49bf6dabe458569c36fccf4ee81dfa1f659238"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/libretro-prboom"
PKG_URL="https://github.com/libretro/libretro-prboom/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of prboom to libretro - plays Doom, Doom II, Final Doom and other Doom IWAD mods."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="prboom_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/lib/libretro
  mkdir -p $INSTALL/usr/share/prboom

  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_BUILD/prboom.wad $INSTALL/usr/share/prboom
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}


