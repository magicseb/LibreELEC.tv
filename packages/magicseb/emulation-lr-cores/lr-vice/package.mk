# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-vice"
PKG_VERSION="cf0226f0a484cef02ff5125ae0849a32b2129b25"
PKG_SHA256="28d0f33eb04c290d28941d59307a4eb4387826777aaba8a4409da5f1dba6bb4a"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/vice-libretro"
PKG_URL="https://github.com/libretro/vice-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Versatile Commodore 8-bit Emulator version 3.0 LIBRETRO WIP"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="vice_x64_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-f Makefile.libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
