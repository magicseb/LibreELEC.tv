# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-kronos"
PKG_VERSION="a1df64b5f1b5434e7aae89d7590de9272c9d4ea8"
PKG_SHA256="e4bcf46f48322b8671c1f22a87172500baee9453f015d1ea557776da5eceb1dc"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/FCare/Kronos"
PKG_URL="https://github.com/FCare/Kronos/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc mesa xorg-server"
PKG_LONGDESC="Kronos is a Sega Saturn emulator forked from uoYabause. "
PKG_TOOLCHAIN="make"

PKG_LIBNAME="kronos_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
