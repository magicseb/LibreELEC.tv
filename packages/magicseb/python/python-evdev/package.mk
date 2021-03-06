# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="python-evdev"
PKG_VERSION="0303d3e"
PKG_SHA256="fcba4863bd87dc0979a5ad19676c10c16fa6998c6f1716e871bba9aa38256969"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/gvalkov/python-evdev"
PKG_URL="https://github.com/gvalkov/python-evdev/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_LONGDESC="This package provides bindings to the generic input event interface in Linux. The evdev interface serves the purpose of passing events generated in the kernel directly to userspace through character devices that are typically located in /dev/input/."
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"
  find . -name setup.py -exec sed -i "s:/usr/include/linux/input.h :$SYSROOT_PREFIX/usr/include/linux/input.h:g" \{} \;
  find . -name setup.py -exec sed -i "s:/usr/include/linux/input-event-codes.h :$SYSROOT_PREFIX/usr/include/linux/input-event-codes.h:g" \{} \;
}

make_target() {
  python setup.py build --cross-compile \
  build_ecodes --evdev-headers $SYSROOT_PREFIX/usr/include/linux/input.h:$SYSROOT_PREFIX/usr/include/linux/input-event-codes.h
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
}
