# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mrboom"
PKG_VERSION="7f18b80a2794cd82d222febeb2fdc9a340fa54dc"
PKG_SHA256="1c20fd76f74354c18ae9b81d000634820e5a84e93e2ec487e93a71c5951ebf98"
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
