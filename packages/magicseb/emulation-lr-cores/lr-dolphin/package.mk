# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-dolphin"
PKG_VERSION="e4ceac846a6179a0e551208b80cc2df569e9f219"
PKG_SHA256="aa9e6a38455661f63067ae13209613ade209d97c7205d5463e6cf84413b8c7e1"
PKG_ARCH="x86_64 aarch64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/dolphin"
PKG_URL="https://github.com/libretro/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc systemd enet bluez lzo alsa-lib ffmpeg curl libpng zlib" #mesa xorg-server 
PKG_LONGDESC="Dolphin is a GameCube / Wii emulator, allowing you to play games for these two platforms on PC with improvements."

PKG_LIBNAME="dolphin_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_configure_target() {
if [ "$BLUETOOTH_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" bluez"
fi

if [ "$OPENGL_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET+=" $OPENGL"
fi

if [ "$OPENGLES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET+=" $OPENGLES"
fi

 PKG_CMAKE_OPTS_TARGET="-DCLANG=ON -DLIBRETRO=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=${CXX} -DCMAKE_C_COMPILER=${CC} -DENABLE_X11=OFF"

}

pre_make_target() {
  # fix cross compiling
  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
  find $PKG_BUILD -name build.ninja -exec sed -i "s:isystem :I:g" \{} \;
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
