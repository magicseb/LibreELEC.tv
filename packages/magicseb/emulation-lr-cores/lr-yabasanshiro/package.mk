################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="lr-yabasanshiro"
PKG_VERSION="fd7b1d0162f973b4a0002f84d6cda03c696f62a4"
PKG_GIT_CLONE_BRANCH="yabasanshiro"
PKG_REV="1"
PKG_ARCH="x86_64 arm"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/yabause"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of YabaSanshiro to libretro."
PKG_LONGDESC="Port of YabaSanshiro to libretro."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  if [ "$ARCH" == "aarch64" ]; then
    make -C yabause/src/libretro platform=rockpro64
  elif [ "$ARCH" == "arm" ]; then
    make -C yabause/src/libretro platform=unix-armv
  else
    make -C yabause/src/libretro
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp yabause/src/libretro/yabasanshiro_libretro.so $INSTALL/usr/lib/libretro/
}
