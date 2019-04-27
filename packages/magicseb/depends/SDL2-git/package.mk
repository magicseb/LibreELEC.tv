# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="SDL2-git"
PKG_VERSION="4cd4ad8df6db00989dad155d43a3f13f9ba22f10" # 2.0.9+
PKG_SHA256="b91987e4bd2a3797a842c8a1ee00bd7a7040f419f6e8c0f888689102e8c44930"
PKG_LICENSE="GPL"
PKG_SITE="https://www.libsdl.org/"
PKG_URL="https://github.com/spurious/SDL-mirror/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib systemd dbus"
PKG_LONGDESC="Simple DirectMedia Layer is a cross-platform development library designed to provide low level access to audio, keyboard, mouse, joystick, and graphics hardware."

# Set up egl-interface
if [ ${PROJECT} = "Amlogic_Legacy" ]; then
  PKG_PATCH_DIRS="Amlogic_Legacy"
fi

configure_package() {
    # Use ppc assembly only for x86_64
  if [ "$TARGET_ARCH" = "x86_64" ]; then
    PKG_DEPENDS_TARGET+=" nasm:host"
  fi

  # X11 Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_DEPENDS_TARGET+=" libX11 libXrandr"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" $OPENGL"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_DEPENDS_TARGET+=" $OPENGLES"
  fi

  # Pulseaudio Support
  if [ "${PULSEAUDIO_SUPPORT}" = yes ]; then
    PKG_DEPENDS_TARGET+=" pulseaudio"
  fi
}

pre_configure_target(){
  PKG_CMAKE_OPTS_TARGET="-DSDL_STATIC=OFF \
                         -DLIBC=ON \
                         -DGCC_ATOMICS=ON \
                         -DALTIVEC=OFF \
                         -DOSS=OFF \
                         -DALSA=ON \
                         -DALSA_SHARED=ON \
                         -DJACK=OFF \
                         -DJACK_SHARED=OFF \
                         -DESD=OFF \
                         -DESD_SHARED=OFF \
                         -DARTS=OFF \
                         -DARTS_SHARED=OFF \
                         -DNAS=OFF \
                         -DNAS_SHARED=OFF \
                         -DLIBSAMPLERATE=OFF \
                         -DLIBSAMPLERATE_SHARED=OFF \
                         -DSNDIO=OFF \
                         -DDISKAUDIO=OFF \
                         -DDUMMYAUDIO=OFF \
                         -DVIDEO_WAYLAND=OFF \
                         -DVIDEO_WAYLAND_QT_TOUCH=ON \
                         -DWAYLAND_SHARED=OFF \
                         -DVIDEO_MIR=OFF \
                         -DMIR_SHARED=OFF \
                         -DVIDEO_COCOA=OFF \
                         -DVIDEO_DIRECTFB=OFF \
                         -DVIDEO_VIVANTE=OFF \
                         -DDIRECTFB_SHARED=OFF \
                         -DFUSIONSOUND=OFF \
                         -DFUSIONSOUND_SHARED=OFF \
                         -DVIDEO_DUMMY=OFF \
                         -DINPUT_TSLIB=OFF \
                         -DPTHREADS=ON \
                         -DPTHREADS_SEM=ON \
                         -DDIRECTX=OFF \
                         -DSDL_DLOPEN=ON \
                         -DCLOCK_GETTIME=OFF \
                         -DRPATH=OFF \
                         -DRENDER_D3D=OFF"

  # Use ppc assembly only for x86_64
  if [ "$TARGET_ARCH" = "x86_64" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DASSEMBLY=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DASSEMBLY=OFF"
  fi

  # X11 Support
  if [ "${DISPLAYSERVER}" = "x11" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_X11=ON \
                             -DX11_SHARED=ON \
                             -DVIDEO_X11_XCURSOR=OFF \
                             -DVIDEO_X11_XINERAMA=OFF \
                             -DVIDEO_X11_XINPUT=OFF \
                             -DVIDEO_X11_XRANDR=ON \
                             -DVIDEO_X11_XSCRNSAVER=OFF \
                             -DVIDEO_X11_XSHAPE=OFF \
                             -DVIDEO_X11_XVM=OFF"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_X11=OFF"
  fi

  # OpenGL Support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGL=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGL=OFF"
  fi

  # OpenGLES Support
  if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGLES=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_OPENGLES=OFF"
  fi

  # RPi Video Support
  if [ "${OPENGLES}" = "bcm2835-driver" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_RPI=ON \
                             -DVIDEO_VULKAN=OFF \
                             -DVIDEO_KMSDRM=OFF"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_RPI=OFF"
  fi



  # AML Mali Video Support
  if [ "${OPENGLES}" = "opengl-meson" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_MALI=ON \
                             -DVIDEO_VULKAN=OFF \
                             -DVIDEO_KMSDRM=OFF"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_MALI=OFF"
  fi



  # Pulseaudio Support
  if [ "${PULSEAUDIO_SUPPORT}" = yes ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DPULSEAUDIO=ON \
                             -DPULSEAUDIO_SHARED=ON"
  else
    PKG_CMAKE_OPTS_TARGET+=" -DPULSEAUDIO=OFF \
                             -DPULSEAUDIO_SHARED=OFF"
  fi

  # ROCKCHIP Mali Video Support
  if [ "$PROJECT" = "Rockchip" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DVIDEO_KMSDRM=ON \
                           -DVIDEO_VULKAN=OFF \
                           -KMSDRM_SHARED=ON"
  else
    PKG_CMAKE_OPTS_TARGET+==" -DVIDEO_KMSDRM=OFF"
fi

}

post_makeinstall_target() {
  sed -e "s:\(['=\" ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" -i $SYSROOT_PREFIX/usr/bin/sdl2-config
  rm -rf $INSTALL/usr/bin
}
