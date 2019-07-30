# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-fbneo"
PKG_VERSION="561e97a781c56390bafa893e7d649a97745b1b0d"
PKG_SHA256="28597773d0c8f21fedc3804b98b4a471e134dd47baa84025611e3844304793f3"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/FBNeo"
PKG_URL="https://github.com/libretro/FBNeo/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="Port of Final Burn Neo to Libretro (v0.2.97.44)."
PKG_TOOLCHAIN="make"

PKG_LIBNAME="fbneo_libretro.so"
PKG_LIBPATH="src/burner/libretro/${PKG_LIBNAME}"

PKG_MAKE_OPTS_TARGET="-C src/burner/libretro/ GIT_VERSION=${PKG_VERSION:0:7}"

pre_configure_target() {
  if [ "$PROJECT" = "RPi" ]; then
    case $DEVICE in
      RPi)
        PKG_MAKE_OPTS_TARGET+=" platform=armv"
        ;;
      RPi2)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi2"
        ;;
      RPi4)
        PKG_MAKE_OPTS_TARGET+=" platform=rpi4"
        ;;
    esac
  else
    # NEON Support ?
    if target_has_feature neon; then
      PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
    fi
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp -v ${PKG_LIBPATH} ${INSTALL}/usr/lib/libretro/
}
