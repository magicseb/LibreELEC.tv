# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="emulationstation-theme-simple-dark"
PKG_VERSION="4c33193cb3efd55b2631d856b9799e4841c3da8f"
PKG_SHA256="07f2cc90a2966c1f66a799c6d8171401f547474f3d95db1838d67e2a1ab20bb9"
PKG_LICENSE="CC-BY-NC-SA-2.0"
PKG_SITE="https://github.com/RetroPie/es-theme-simple-dark"
PKG_URL="https://github.com/RetroPie/es-theme-simple-dark/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Simple dark theme for Emulationstation based on Theme 'simple' v1.3 - 11-29-2014"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  # Install stock theme
  ES_THEME_PATH=/usr/share/emulationstation/themes/simple-dark
  mkdir -p $INSTALL/usr/config/emulationstation/themes
  mkdir -p $INSTALL/${ES_THEME_PATH}
  cp -r *  $INSTALL/${ES_THEME_PATH}
  ln -s    ${ES_THEME_PATH} $INSTALL/usr/config/emulationstation/themes/simple-dark

  # Add missing common systems
  cp -a $PKG_DIR/files/2048      $INSTALL/${ES_THEME_PATH}/
  cp -a $PKG_DIR/files/chailove  $INSTALL/${ES_THEME_PATH}/
  cp -a $PKG_DIR/files/mrboom    $INSTALL/${ES_THEME_PATH}/
  cp -a $PKG_DIR/files/moonlight $INSTALL/${ES_THEME_PATH}/
  cp -a $PKG_DIR/files/prboom    $INSTALL/${ES_THEME_PATH}/
  cp -a $PKG_DIR/files/tyrquake  $INSTALL/${ES_THEME_PATH}/

  # Add missing generic systems
  if [ "$PROJECT" = "Generic" ]; then
    cp -a $PKG_DIR/files/n3ds $INSTALL/${ES_THEME_PATH}/
  fi

  # Add scroll sound to menu 
  cp $PKG_DIR/files/scroll.wav $INSTALL/${ES_THEME_PATH}/art/
}
