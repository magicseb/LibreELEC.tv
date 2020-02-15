# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-mgba"
PKG_VERSION="52a4cbcb81fc9aff4c0588bd5e70653bc5042932"
PKG_LICENSE="MPL 2.0"
PKG_SITE="https://github.com/mgba-emu/mgba"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain linux glibc zlib"
PKG_LONGDESC="mGBA is an emulator for running Game Boy Advance games."

PKG_LIBNAME="mgba_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

GET_HANDLER_SUPPORT="git"

configure_package() {
  if [ "${OPENGL_SUPPORT}" = "yes" -a "${PROJECT}" = "Generic" ]; then
    PKG_DEPENDS_TARGET+=" libepoxy"
  fi
}

pre_configure_target() {
  PKG_CMAKE_OPTS_TARGET="-DUSE_DEBUGGERS=OFF \
                         -DBUILD_QT=OFF \
                         -DUSE_SQLITE3=OFF \
                         -DBUILD_SDL=OFF \
                         -DBUILD_LIBRETRO=ON \
                         -DSKIP_LIBRARY=ON \
                         -DUSE_FFMPEG=OFF \
                         -DUSE_ZLIB=ON \
                         -DUSE_MINIZIP=OFF \
                         -DUSE_LIBZIP=OFF \
                         -DUSE_MAGICK=OFF \
                         -DUSE_ELF=OFF"

 if [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GLES3=ON \
				-DBUILD_GLES2=OFF \
                             -DUSE_EPOXY=OFF"

 fi

   if [ "${DEVICE}" = "RPi4" ]; then
    PKG_CMAKE_OPTS_TARGET+=" -DBUILD_GLES3=ON \
				-DBUILD_GLES2=OFF \
                             -DUSE_EPOXY=OFF"

  fi

}

pre_make_target() {
  sed -e "s/set(VERSION_STRING \${GIT_BRANCH}-\${GIT_REV}-\${GIT_COMMIT_SHORT})/set(VERSION_STRING master-${PKG_VERSION:0:7})/" -i ${PKG_BUILD}/version.cmake
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
