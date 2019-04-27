# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-samples"
PKG_VERSION="32aa98eeaad66cc3318d6e821a7a83de75603831"
PKG_SHA256="a634e8d2789691b69bdc82eea912917845eb18b02d3f444c495e029591263f46"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/libretro-samples"
PKG_URL="https://github.com/libretro/libretro-samples/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc"
PKG_LONGDESC="A set of samples to illustrate libretro API."
PKG_TOOLCHAIN="manual"

configure_package() {
  # Displayserver Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" xorg-server"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" ${OPENGL}"
  fi
}

make_target() {
 make -C input/button_test
 make -C midi/midi_test
 make -C tests/test

 if [ "${ARCH}" = "x86_64" ]; then
   make -C tests/test_advanced
   make -C video/opengl/libretro_test_gl_fixedfunction
   make -C video/opengl/libretro_test_gl_shaders
 fi

 if [ "${VULKAN_SUPPORT}" = "yes" ]; then
   make -C video/vulkan/vk_rendering
   make -C video/vulkan/vk_async_compute
 fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro

  cp input/button_test/*.so $INSTALL/usr/lib/libretro/
  cp midi/midi_test/*.so $INSTALL/usr/lib/libretro/
  cp tests/test/*.so $INSTALL/usr/lib/libretro/

  if [ "${ARCH}" = "x86_64" ]; then
    cp tests/test_advanced/*.so $INSTALL/usr/lib/libretro/
    cp video/opengl/libretro_test_gl_fixedfunction/*.so $INSTALL/usr/lib/libretro/
    cp video/opengl/libretro_test_gl_shaders/*.so $INSTALL/usr/lib/libretro/
  fi

  if [ "${VULKAN_SUPPORT}" = "yes" ]; then
    cp video/vulkan/vk_rendering/*.so $INSTALL/usr/lib/libretro/
    cp video/vulkan/vk_async_compute/*.so $INSTALL/usr/lib/libretro/
  fi
}
