# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mesen"
PKG_VERSION="942633dd3dbb73cc3abd748f6d5440c78abbea09"
PKG_SHA256="9c74ab74eaab41efe1541840792fa18c210d70aa692415f9235e41d9e5e999f6"
PKG_ARCH="arm x86_64"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/SourMesen/Mesen"
PKG_URL="https://github.com/SourMesen/Mesen/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mesen_libretro.so"
PKG_LIBPATH="Libretro/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C Libretro"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
