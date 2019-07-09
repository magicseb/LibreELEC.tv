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
  baseone \
  retroarch \
  rr-config-tool \
  lr-2048 \
  lr-atari800 \
  lr-beetle-pce-fast \
  lr-beetle-wswan \
  lr-bluemsx \
  lr-desmume \
  lr-dosbox \
  lr-fbalpha \
  lr-fceumm \
  lr-fuse \
  lr-gambatte \
  lr-genplus \
  lr-mame2003-plus \
  lr-mrboom \
  lr-mupen64plus \
  lr-mupen64plus-nx \
  lr-nestopia \
  lr-pcsx-rearmed \
  lr-prboom \
  lr-reicast \
  lr-scummvm \
  lr-snes9x \
  lr-stella \
  lr-tyrquake"


OEM_EMU_GENERIC=" \
  lr-beetle-saturn \
  lr-bsnes-mercury-accuracy \
  lr-bsnes-mercury-balanced \
  lr-dolphin \
  lr-mame2016 \
  lr-mesen \
  lr-parallel-n64 \
  lr-ppsspp"

OEM_EMU_RPI=" \
  lr-mame2010 \
  lr-snes9x2010 \
  lr-vice \
  lr-yabause"

OEM_EMU_ROCKCHIP=" \
  lr-mame2010 \
  lr-snes9x2010 \
  lr-vice \
  lr-yabause"


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
  esac
fi

