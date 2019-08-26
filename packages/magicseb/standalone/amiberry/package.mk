# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="amiberry"
PKG_VERSION="abf0e0cb6e73e5e1b87433cd6a5d01f967ccaf77" # v2.25+
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry.git"
PKG_DEPENDS_TARGET="toolchain linux glibc bzip2 zlib SDL2-git SDL2_image SDL2_ttf capsimg freetype libxml2 flac libogg mpg123-system libpng libmpeg2 retroarch-joypad-autoconfig"
PKG_LONGDESC="Amiberry is an optimized Amiga emulator for ARM-based boards."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

PKG_MAKE_OPTS_TARGET="all"

pre_configure_target() {
  cd ${PKG_BUILD}
  export SYSROOT_PREFIX=${SYSROOT_PREFIX}

  case ${PROJECT} in
    Amlogic)
      if [ "${DEVICE}" = "AMLG12" ]; then
        AMIBERRY_PLATFORM="amlg12"
      else
        AMIBERRY_PLATFORM="amlgx"
      fi
      ;;
    Rockchip)
      if [ "${DEVICE}" = "RK3399" ]; then
        AMIBERRY_PLATFORM="rockpro64"
      else
        AMIBERRY_PLATFORM="tinker"
      fi
      ;;
    RPi)
      if [ "${DEVICE}" = "RPi2" ]; then
        AMIBERRY_PLATFORM="rpi2-sdl2"
      else
       if [ "${DEVICE}" = "RPi4" ]; then
        AMIBERRY_PLATFORM="rpi4-sdl2"
       else
        AMIBERRY_PLATFORM="rpi1-sdl2"
       fi
      fi
      ;;
  esac

  PKG_MAKE_OPTS_TARGET+=" PLATFORM=${AMIBERRY_PLATFORM}"
}

makeinstall_target() {
  # Create directories
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/lib
  mkdir -p ${INSTALL}/usr/config/amiberry/controller

  # Copy ressources
  cp -a ${PKG_DIR}/config/*           ${INSTALL}/usr/config/amiberry/
  cp -a data                          ${INSTALL}/usr/config/amiberry/
  cp -a savestates                    ${INSTALL}/usr/config/amiberry/
  cp -a screenshots                   ${INSTALL}/usr/config/amiberry/
  cp -a whdboot                       ${INSTALL}/usr/config/amiberry/
  ln -s /storage/roms/bios/Kickstarts ${INSTALL}/usr/config/amiberry/kickstarts

  # Create links to Retroarch controller files
  ln -s /usr/share/retroarch/autoconfig/udev/8Bitdo_Pro_SF30_BT_B.cfg "${INSTALL}/usr/config/amiberry/controller/8Bitdo SF30 Pro.cfg"
  ln -s "/usr/share/retroarch/autoconfig/udev/Pro Controller.cfg"     "${INSTALL}/usr/config/amiberry/controller/Pro Controller.cfg"

  # Copy binary, scripts & link libcapsimg
  cp -av amiberry-${AMIBERRY_PLATFORM} ${INSTALL}/usr/bin/amiberry
  cp -a ${PKG_DIR}/scripts/*           ${INSTALL}/usr/bin
  ln -sf /usr/lib/libcapsimage.so.5.1  ${INSTALL}/usr/config/amiberry/capsimg.so
}
