# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="fs-uae"
PKG_VERSION="3d6a8dc"
PKG_SHA256="915e7033bfc1416c81e29bcc27e8baae4ceb21b1f5c379665b17526f2e0d7690"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/FrodeSolheim/fs-uae"
PKG_URL="https://github.com/FrodeSolheim/fs-uae/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc glib SDL2-git glew glu libmpeg2 libXi openal-soft capsimg zlib libpng"
PKG_LONGDESC="FS-UAE amiga emulator."
PKG_TOOLCHAIN="autotools"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi
}

pre_configure_target() {
  export ac_cv_func_realloc_0_nonnull=yes
  export SYSROOT_PREFIX
  cp $PKG_DIR/input/* ../share/fs-uae/input/
}

post_makeinstall_target() {
  # install scripts
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/

  # set up default config directory
  mkdir -p $INSTALL/usr/config
  cp -R $PKG_DIR/config $INSTALL/usr/config/fs-uae
  ln -s /storage/roms/bios/Kickstarts $INSTALL/usr/config/fs-uae/Kickstarts

  # create symlink to capsimg for IPF support
  mkdir -p $INSTALL/usr/config/fs-uae/Plugins
  ln -sf /usr/lib/libcapsimage.so.5.1 $INSTALL/usr/config/fs-uae/Plugins/capsimg.so

  # clean up
  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/icons
  rm -rf $INSTALL/usr/share/mime
}
