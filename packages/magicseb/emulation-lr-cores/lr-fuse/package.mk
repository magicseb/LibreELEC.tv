# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fuse"
PKG_VERSION="37c8a3c8c0306f7f2d6a356c41bae96fc656d983"
PKG_SHA256="60c59fbb4c129664bd050b957cd29792109a504916693efaf3331cce97feb71f"
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
