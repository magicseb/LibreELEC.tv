# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-kronos"
PKG_VERSION="03eb218f8e56f3e7c8aec424618124682943627b"
PKG_SHA256="3d1d876c89b809549339df4fc2edb555a2b45b42356cf9496dd50f3185988a83"
PKG_ARCH="x86_64 arm"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/FCare/Kronos"
PKG_URL="https://github.com/FCare/Kronos/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc mesa"
PKG_LONGDESC="Kronos is a Sega Saturn emulator forked from uoYabause. "
PKG_TOOLCHAIN="make"

PKG_LIBNAME="kronos_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

PKG_MAKE_OPTS_TARGET="-C yabause/src/libretro GIT_VERSION=${PKG_VERSION:0:7}"

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
