# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fuse"
PKG_VERSION="43d01dec6ad26e6014fabf79dbcf6a04ac2c7eea"
PKG_SHA256="f6a170d126d46dee2442127bea7fab54fcd641a663941c92e087f00d38430251"
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
