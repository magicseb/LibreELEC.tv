# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="oem"
PKG_VERSION="1.0"
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="oem"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"

PKG_TOOLCHAIN="manual"

      
OEM_EMU_COMMON=" \
  sixpair\
  sixaxis \
  baseone \
  lr-4do \
  lr-2048 \
  lr-81 \
  lr-atari800 \
  lr-beetle-bsnes \
  lr-beetle-gba \
  lr-beetle-lynx \
  lr-beetle-ngp \
  lr-beetle-pce-fast \
  lr-beetle-pcfx \
  lr-beetle-psx \
  lr-beetle-saturn \
  lr-beetle-supergrafx \
  lr-beetle-wswan \
  lr-beetle-vb \
  lr-bnes \
  lr-cap32 \
  lr-crocods \
  lr-bluemsx \
  lr-desmume \
  lr-dinothawr \
  lr-dosbox \
  lr-fbneo \
  lr-fceumm \
  lr-flycast \
  lr-fuse \
  lr-gambatte \
  lr-genplus \
  lr-hatari \
  lr-mame2003-plus \
  lr-mesen \
  lr-mesen-s \
  lr-mgba \
  lr-mrboom \
  lr-mupen64plus \
  lr-mupen64plus-nx \
  lr-nestopia \
  lr-pcsx-rearmed \
  lr-prboom \
  lr-scummvm \
  lr-snes9x \
  lr-stella \
  lr-tyrquake \
  lr-virtualjaguar \
  retroarch"


OEM_EMU_GENERIC=" \
  lr-beetle-saturn \
  lr-bsnes-mercury-accuracy \
  lr-bsnes-mercury-balanced \
  lr-dolphin \
  lr-mame2016 \
  lr-parallel-n64 \
  lr-ppsspp"

OEM_EMU_RPI=" \
  emulationstation \
  SDL_GameControllerDB \
  amiberry \
  lr-mame2010 \
  lr-ppsspp \
  lr-puae \
  lr-snes9x2010 \
  lr-vice \
  lr-yabause"

OEM_EMU_ROCKCHIP=" \
  emulationstation \
  SDL_GameControllerDB \
  lr-puae \
  lr-snes9x2010 \
  lr-vice \
  lr-yabasanshiro"

OEM_EMU_AMLOGIC=" \
  emulationstation \
  SDL_GameControllerDB \
  lr-puae \
  lr-snes9x2010 \
  lr-vice"

if [ "$OEM_EMU" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_COMMON"
  case $PROJECT in
    Rockchip)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_ROCKCHIP"
      ;;
    Generic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_GENERIC"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_RPI"
      ;;
    Amlogic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_AMLOGIC"
      ;;
  esac
fi

