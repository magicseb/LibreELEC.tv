# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="gst-plugins-base"
PKG_VERSION="1.14.4"
PKG_SHA256="ca6139490e48863e7706d870ff4e8ac9f417b56f3b9e4b3ce490c13b09a77461"
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-plugins-base.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-plugins-base/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer"
PKG_LONGDESC="Base GStreamer plugins and helper libraries"

PKG_MESON_OPTS_TARGET="-Ddisable_examples=true \
                       -Ddisable_gtkdoc=true"

post_makeinstall_target(){
  # Clean up
  rm -rf $INSTALL/usr/bin
}

