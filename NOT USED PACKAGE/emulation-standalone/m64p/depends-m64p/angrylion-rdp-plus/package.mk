# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="angrylion-rdp-plus"
PKG_VERSION="e129b27aa2c27f0ee41b686aabbeb99b7554262d"
PKG_SHA256="d96baf687b1639b246a994c52aa76729df3cbebde61ce212aebbbeabcf803a64"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/ata4/angrylion-rdp-plus"
PKG_URL="https://github.com/ata4/angrylion-rdp-plus/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc freetype zlib"
PKG_LONGDESC="A low-level N64 video emulation plugin, based on the pixel-perfect angrylion RDP plugin with some improvements."

makeinstall_target() {
 :
}
