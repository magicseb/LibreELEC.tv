# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="emulationstation"
PKG_VERSION="25ef0c8b77b7d4c1b5e84c330bef7472f432ab3a" #v2.8.2
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/RetroPie/EmulationStation"
PKG_URL="https://github.com/RetroPie/EmulationStation.git"
PKG_GIT_CLONE_BRANCH="stable"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd dbus openssl zlib libpng alsa-lib SDL2-git freetype curl freeimage bzip2 vlc emulationstation-theme-carbon emulationstation-theme-simple-dark "
PKG_LONGDESC="A Fork of Emulation Station for RetroPie. Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
PKG_BUILD_FLAGS="-gold"
GET_HANDLER_SUPPORT="git"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGLES}"
  fi
}

post_makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/etc/emulationstation
  mkdir -p $INSTALL/usr/config/emulationstation
  mkdir -p $INSTALL/usr/lib/tmpfiles.d

  # Create symlinks for themes & config files
  ln -s /usr/config/emulationstation/es_systems.cfg $INSTALL/etc/emulationstation/
  ln -s /usr/config/emulationstation/themes         $INSTALL/etc/emulationstation/themes

  # Install scripts
  cp $PKG_DIR/scripts/${PROJECT}/emulationstation.start $INSTALL/usr/bin/

  # Install resources
  cp -r $PKG_DIR/files/*     $INSTALL/usr/config/emulationstation/
  cp -a $PKG_BUILD/resources $INSTALL/usr/config/emulationstation/

  # Install config files
  cp $PKG_DIR/config/es_input.cfg          $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/es_settings.cfg       $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/es_systems.cfg                 $INSTALL/usr/config/emulationstation/
  cp $PKG_DIR/config/${PROJECT}/emulationstation-userdirs.conf $INSTALL/usr/lib/tmpfiles.d/
}
