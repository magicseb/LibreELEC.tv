# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="qt-everywhere"
PKG_VERSION="5.12.0"
PKG_SHA256="356f42d9087718f22f03d13d0c2cdfb308f91dc3cf0c6318bed33f2094cd9d6c"
PKG_LICENSE="GPL"
PKG_SITE="http://qt-project.org"
PKG_URL="http://download.qt.io/archive/qt/${PKG_VERSION%.*}/$PKG_VERSION/single/$PKG_NAME-src-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo libpng pcre2 sqlite zlib freetype gstreamer gst-plugins-base gst-plugins-good gst-libav"
PKG_LONGDESC="A cross-platform application and UI framework"

pre_configure_target() {
  # Fix cross compiling
  sed -e "s/QMAKE_CFLAGS_ISYSTEM        = -isystem/QMAKE_CFLAGS_ISYSTEM        = -I/" -i ${PKG_BUILD}/qtbase/mkspecs/common/gcc-base.conf

  PKG_CONFIGURE_OPTS_TARGET="-prefix /usr
                             -sysroot ${SYSROOT_PREFIX}
                             -hostprefix ${TOOLCHAIN}
                             -device linux-libreelec-g++
                             -device-option CROSS_COMPILE=${TARGET_PREFIX}
                             -fontconfig
                             -opensource -confirm-license
                             -release
                             -shared
                             -make libs
                             -nomake examples
                             -nomake tests
                             -ccache
                             -gstreamer 1.0
                             -force-pkg-config
                             -silent
                             -system-libjpeg
                             -system-libpng
                             -system-pcre
                             -system-sqlite
                             -system-zlib
                             -no-accessibility
                             -no-cups
                             -no-dbus
                             -no-evdev
                             -no-gif
                             -no-glib
                             -no-harfbuzz
                             -no-iconv
                             -no-icu
                             -no-libproxy
                             -no-mtdev
                             -no-sql-mysql
                             -no-strip
                             -no-tslib
                             -no-feature-linuxfb
                             -no-feature-openal
                             -no-feature-qml-debug
                             -no-feature-printer
                             -no-feature-vnc
                             -skip qt3d
                             -skip qtactiveqt
                             -skip qtandroidextras
                             -skip qtcharts
                             -skip qtconnectivity
                             -skip qtdatavis3d
                             -skip qtdoc
                             -skip qtlocation
                             -skip qtmacextras
                             -skip qtnetworkauth
                             -skip qtpurchasing
                             -skip qtquickcontrols
                             -skip qtremoteobjects
                             -skip qtscript
                             -skip qtscxml
                             -skip qtsensors
                             -skip qtserialport
                             -skip qtserialbus
                             -skip qtspeech
                             -skip qttranslations
                             -skip qtvirtualkeyboard
                             -skip qtwayland
                             -skip qtwebchannel
                             -skip qtwebengine
                             -skip qtwebsockets
                             -skip qtwebview
                             -skip qtwinextras
                             -skip qtx11extras"

  # Build with OpenGL or OpenGLES support
  if [ "${OPENGL_SUPPORT}" = "yes" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" -opengl -no-eglfs"
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    PKG_CONFIGURE_OPTS_TARGET+=" -opengl es2"
  fi

}


configure_target() {
  QMAKE_CONF_DIR="qtbase/mkspecs/devices/linux-libreelec-g++"
  QMAKE_CONF="${QMAKE_CONF_DIR}/qmake.conf"

  cd ..
  mkdir -p $QMAKE_CONF_DIR

  # Set QMake Platform Flags
  echo "MAKEFILE_GENERATOR       = UNIX"           > $QMAKE_CONF
  echo "CONFIG                  += incremental"   >> $QMAKE_CONF
  echo "QMAKE_INCREMENTAL_STYLE  = sublib"        >> $QMAKE_CONF
  echo "include(../../common/linux.conf)"         >> $QMAKE_CONF
  echo "include(../../common/gcc-base-unix.conf)" >> $QMAKE_CONF
  echo "include(../../common/g++-unix.conf)"      >> $QMAKE_CONF
  echo "load(device_config)"                      >> $QMAKE_CONF
  echo "QMAKE_CC                = $CC"            >> $QMAKE_CONF
  echo "QMAKE_CXX               = $CXX"           >> $QMAKE_CONF
  echo "QMAKE_LINK              = $CXX"           >> $QMAKE_CONF
  echo "QMAKE_LINK_SHLIB        = $CXX"           >> $QMAKE_CONF
  echo "QMAKE_AR                = $AR cqs"        >> $QMAKE_CONF
  echo "QMAKE_OBJCOPY           = $OBJCOPY"       >> $QMAKE_CONF
  echo "QMAKE_NM                = $NM -P"         >> $QMAKE_CONF
  echo "QMAKE_STRIP             = $STRIP"         >> $QMAKE_CONF
  echo "QMAKE_CFLAGS = $CFLAGS"                   >> $QMAKE_CONF
  echo "QMAKE_CXXFLAGS = $CXXFLAGS"               >> $QMAKE_CONF
  echo "QMAKE_LFLAGS = $LDFLAGS"                  >> $QMAKE_CONF
  if [ "${OPENGLES}" = "opengl-meson" ]; then
    echo "QMAKE_LIBS_EGL += -lMali"               >> $QMAKE_CONF
    echo "EGLFS_DEVICE_INTEGRATION = eglfs_mali"  >> $QMAKE_CONF
  elif [ "${OPENGLES}" = "bcm2835-driver" ]; then
    echo "QMAKE_LIBS_EGL += -lEGL -lGLESv2"       >> $QMAKE_CONF
    echo "EGLFS_DEVICE_INTEGRATION = eglfs_brcm"  >> $QMAKE_CONF
  elif [ "${OPENGLES}" = "libmali" ]; then
    echo "QMAKE_LIBS_EGL += -lEGL -lGLESv2"       >> $QMAKE_CONF
    echo "EGLFS_DEVICE_INTEGRATION = eglfs_kms"  >> $QMAKE_CONF
  fi
  echo "load(qt_config)"                          >> $QMAKE_CONF
  echo '#include "../../linux-g++/qplatformdefs.h"' >> $QMAKE_CONF_DIR/qplatformdefs.h

  unset CC CXX LD RANLIB AR AS CPPFLAGS CFLAGS LDFLAGS CXXFLAGS
  export QT_FORCE_PKGCONFIG=yes
  ./configure $PKG_CONFIGURE_OPTS_TARGET
}

post_makeinstall_target() {
  # Create directories
  mkdir -p $INSTALL/usr/lib
  mkdir -p $INSTALL/usr/plugins
  mkdir -p $INSTALL/usr/qml

  # Install Qt5 libs
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Concurrent.so*         $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Core.so*               $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Gamepad.so*            $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Gui.so*                $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Multimedia.so*         $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5MultimediaGstTools.so* $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5MultimediaQuick.so*    $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5MultimediaWidgets.so*  $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Network.so*            $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5OpenGL.so*             $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Qml.so*                $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Quick.so*              $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5QuickControls2.so*     $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5QuickParticles.so*     $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5QuickTemplates2.so*    $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5QuickTest.so*          $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Sql.so*                $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Svg.so*                $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Test.so*               $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Widgets.so*            $INSTALL/usr/lib
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5Xml.so*                $INSTALL/usr/lib

  # Install Qt5 plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/audio             $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/gamepads          $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/imageformats      $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/iconengines       $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/mediaservice      $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/platforms         $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/playlistformats   $INSTALL/usr/plugins
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/sqldrivers        $INSTALL/usr/plugins

  # Install Qt5 QML
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtCanvas3D         $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtGamepad          $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtGraphicalEffects $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtMultimedia       $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtQuick            $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtQuick.2          $INSTALL/usr/qml
  cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/qml/QtTest             $INSTALL/usr/qml

  # Install XCB libs & plugins if X11 is present
  if [ ${DISPLAYSERVER} = "x11" ]; then
    cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5XcbQpa.so*      $INSTALL/usr/lib
    cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/xcbglintegrations $INSTALL/usr/plugins
  elif [ "${OPENGLES_SUPPORT}" = "yes" ]; then
    cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/lib/libQt5EglFSDeviceIntegration.so* $INSTALL/usr/lib
    cp -PR ${PKG_ORIG_SYSROOT_PREFIX:-${SYSROOT_PREFIX}}/usr/plugins/egldeviceintegrations        $INSTALL/usr/plugins
  fi
}
