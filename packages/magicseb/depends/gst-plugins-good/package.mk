# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="gst-plugins-good"
PKG_VERSION="1.14.4"
PKG_SHA256="5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979"
PKG_LICENSE="GPL"
PKG_SITE="https://gstreamer.freedesktop.org/modules/gst-plugins-good.html"
PKG_URL="https://gstreamer.freedesktop.org/src/gst-plugins-good/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain gstreamer gst-plugins-base"
PKG_LONGDESC="Good GStreamer plugins and helper libraries"
PKG_TOOLCHAIN="configure"

post_makeinstall_target(){
  # Clean up
  rm -rf $INSTALL/usr/share
}
