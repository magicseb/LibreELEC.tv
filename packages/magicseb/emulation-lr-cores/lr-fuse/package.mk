# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fuse"
PKG_VERSION="4df6297df30621bde0a827c435c7a699099d3059"
PKG_SHA256="674665fee6344cd61c159fb45767efac5a5fa61255ce2a94974f4f99196a678f"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/fuse-libretro"
PKG_URL="https://github.com/libretro/fuse-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="fuse-libretro is an work in progress port of the Fuse Unix Spectrum Emulator to libretro."

PKG_LIBNAME="fuse_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
