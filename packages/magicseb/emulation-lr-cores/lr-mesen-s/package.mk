# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mesen-s"
PKG_VERSION="371a7a1ac8af5f100352996188c175c5c6bdaaa0"
#PKG_SHA256="e8b782affffb9adb219bf1242a7e61a673c1fb23d979cb389f4ec2d34ff06711"
PKG_ARCH="arm x86_64"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/SourMesen/Mesen-S"
PKG_URL="https://github.com/SourMesen/Mesen-S/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
PKG_TOOLCHAIN="make"

PKG_LIBNAME="mesen-s_libretro.so"
PKG_LIBPATH="Libretro/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C Libretro"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
