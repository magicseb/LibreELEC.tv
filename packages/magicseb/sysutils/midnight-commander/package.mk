# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="midnight-commander"
PKG_VERSION="4.8.22"
PKG_SHA256="a15a9a437a230f306848a8ab9e7e2d686a7984d2d4da179ce3c4c1eb730ce0ab"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org"
PKG_URL="https://github.com/MidnightCommander/mc/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain gettext:host glib libssh2 libtool:host ncurses pcre"
PKG_LONGDESC="GNU Midnight Commander (also referred to as MC) is a user shell with text-mode full-screen interface."
PKG_TOOLCHAIN="configure"

pre_configure_target() {
  PKG_CONFIGURE_OPTS_TARGET="--enable-silent-rules \
                             --datadir=/usr/share \
                             --libexecdir=/usr/lib \
                             --sysconfdir=/etc \
                             --with-screen=ncurses \
                             --with-sysroot=$SYSROOT_PREFIX \
                             --disable-aspell \
                             --without-diff-viewer \
                             --disable-doxygen-doc \
                             --disable-doxygen-dot \
                             --disable-doxygen-html \
                             --with-gnu-ld \
                             --without-libiconv-prefix \
                             --without-libintl-prefix \
                             --with-internal-edit \
                             --disable-mclib \
                             --with-subshell \
                             --enable-vfs-extfs \
                             --enable-vfs-ftp \
                             --enable-vfs-sftp \
                             --enable-vfs-tar \
                             --without-x"

  LDFLAGS="$LDFLAGS -lcrypto -lssl"
  $PKG_BUILD/autogen.sh
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/mc/help/mc.hlp.*
  mv $INSTALL/usr/bin/mc $INSTALL/usr/bin/mc-bin
  rm -f $INSTALL/usr/bin/{mcedit,mcview}
  cp $PKG_DIR/wrapper/* $INSTALL/usr/bin
}
