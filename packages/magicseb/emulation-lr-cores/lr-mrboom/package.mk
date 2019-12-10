# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mrboom"
PKG_VERSION="74b4859b898c607b59988b6100ca3117d3d9778c"
PKG_SHA256="58ae333bf57c2dfc63c7966d6d65e1f7e3651add55d9e00763184e8933643a5a"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/libretro/mrboom-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mr.Boom is an 8 player Bomberman clone for RetroArch/Libretro"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mrboom_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  # Disable NEON otherwise build fails
  if target_has_feature neon; then
    PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config/retroarch/playlists
  mkdir -p $INSTALL/usr/lib/libretro

  #create Retroarch Playlist
  cp $PKG_DIR/files/* $INSTALL/usr/config/retroarch/playlists
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
