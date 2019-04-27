# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="pcre2"
PKG_VERSION="10.32"
PKG_SHA256="f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
PKG_LICENSE="BSD"
PKG_SITE="http://www.pcre.org/"
PKG_URL="https://ftp.pcre.org/pub/pcre/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5"
PKG_BUILD_FLAGS="+pic"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=OFF \
                       -DPCRE2_BUILD_PCRE2_16=ON \
                       -DPCRE2_SUPPORT_JIT=ON \
                       -DPCRE2_SUPPORT_LIBREADLINE=OFF"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
