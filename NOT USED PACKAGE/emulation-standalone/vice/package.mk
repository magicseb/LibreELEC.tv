# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="vice"
PKG_VERSION="3.3"
PKG_SHA256="1a55b38cc988165b077808c07c52a779d181270b28c14b5c9abf4e569137431d"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv3"
PKG_SITE="http://vice-emu.sourceforge.net/"
PKG_URL="https://sourceforge.net/projects/vice-emu/files/releases/vice-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc alsa-lib SDL2-git libpng giflib zlib portaudio libvorbis libogg lame flac"
PKG_LONGDESC="VICE C64 emulator"
PKG_TOOLCHAIN="configure"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="ac_cv_prog_sdl2_config=$SYSROOT_PREFIX/usr/bin/sdl2-config \
                             toolchain_check=no \
                           --prefix=/usr \
                           --enable-silent-rules \
                           --disable-option-checking \
                           --disable-catweasel \
                           --enable-native-tools=$HOST_CC \
                           --enable-sdlui2 \
                           --disable-parsid \
                           --disable-hardsid \
                           --without-alsa \
                           --without-pulse \
                           --with-sdlsound \
                           --without-oss"

  export LIBS="-ludev"
  $PKG_BUILD/autogen.sh
}

post_makeinstall_target() {
  # Copy start script
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin

  # Rename the lib directory as LE has a lib64 symlink to lib
  if [ -d $INSTALL/usr/lib64 ]; then
    mv $INSTALL/usr/lib64 $INSTALL/usr/lib
  fi

  # Copy default config
  mkdir -p $INSTALL/etc
  mkdir -p $INSTALL/usr/config/vice
  cp $PKG_DIR/config/sdl-vicerc $INSTALL/etc/
  cp $PKG_DIR/config/sdl-vicerc $INSTALL/usr/config/vice/

  # Remove binaries
  for bin in \
    c1541 \
    cartconv \
    petcat \
    vsid \
    x128 \
    x64dtv \
    x64sc \
    xcbm2 \
    xcbm5x0 \
    xpet \
    xplus4 \
    xscpu64 \
    xvic
  do
    rm $INSTALL/usr/bin/$bin
  done

  # Remove data files
  for dir in \
    C128 \
    C64DTV \
    CBM-II \
    PET \
    PLUS4 \
    PRINTER \
    SCPU64 \
    VIC20
  do
    rm -rf $INSTALL/usr/lib/vice/${dir}
  done
 }
