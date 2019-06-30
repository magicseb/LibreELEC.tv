# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-gambatte"
PKG_VERSION="92127a6e3f60c5fe7579a7d9dafbf8fd5c67af69"
PKG_SHA256="0d5e4c9fab28e6db41d59bc772458c2e0c76acfbdfac1da13548e8c219d73e28"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/gambatte-libretro"
PKG_URL="https://github.com/libretro/gambatte-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Gambatte is an accuracy-focused, open-source, cross-platform Game Boy Color emulator written in C++."

PKG_LIBNAME="gambatte_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
