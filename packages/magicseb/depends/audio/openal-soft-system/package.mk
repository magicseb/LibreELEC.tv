# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Frank Hartung (supervisedthinking (@) gmail.com)

PKG_NAME="openal-soft-system"
PKG_VERSION="1.19.1"
PKG_SHA256="9f3536ab2bb7781dbafabc6a61e0b34b17edd16bd6c2eaf2ae71bc63078f98c7"
PKG_LICENSE="GPL"
PKG_SITE="http://www.openal.org/"
PKG_URL="https://github.com/kcat/openal-soft/archive/openal-soft-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib openal-soft-system:host"
PKG_LONGDESC="OpenAL Soft is a software implementation of the OpenAL 3D audio API."

configure_package() {
  PKG_CMAKE_OPTS_HOST="-DALSOFT_NATIVE_TOOLS=on \
                       -DALSOFT_BACKEND_OSS=off \
                       -DALSOFT_BACKEND_WAVE=off \
                       -DALSOFT_EXAMPLES=off \
                       -DALSOFT_TESTS=off \
                       -DALSOFT_UTILS=off"

  PKG_CMAKE_OPTS_TARGET="-DALSOFT_NATIVE_TOOLS=off -DNATIVE_BIN_DIR=${PKG_BUILD}/.${HOST_NAME}/native-tools/ \
                         -DALSOFT_BACKEND_OSS=off \
                         -DALSOFT_BACKEND_WAVE=off \
                         -DALSOFT_BACKEND_PULSEAUDIO=on \
                         -DALSOFT_EXAMPLES=off \
                         -DALSOFT_TESTS=off \
                         -DALSOFT_UTILS=off"
}

post_makeinstall_target() {
  mkdir -p ${INSTALL}/etc/openal
   sed s/^#drivers.*/drivers=alsa/ ${INSTALL}/usr/share/openal/alsoftrc.sample > ${INSTALL}/etc/openal/alsoft.conf
   safe_remove ${INSTALL}/usr/share/openal
}
