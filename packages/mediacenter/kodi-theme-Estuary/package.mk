# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="kodi-theme-Estuary"
PKG_VERSION="1.0"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="kodi"
PKG_LONGDESC="Kodi Mediacenter default theme."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/
#Patch for Emulationstation/Retroarch
    patch -d $INSTALL/usr/share/kodi/addons/skin.estuary -p1 < $PKG_DIR/files/kodi-theme-Estuary-100.02-emulationstation-menu.patch
    patch -d $INSTALL/usr/share/kodi/addons/skin.estuary -p1 < $PKG_DIR/files/kodi-theme-Estuary-100.03-retroarch-menu.path
    cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.estuary $INSTALL/usr/share/kodi/addons/
}

