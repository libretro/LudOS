# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="ludo"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/ludo"
PKG_DEPENDS_TARGET="toolchain openal-soft"
PKG_LONGDESC="A libretro frontend written in golang."
PKG_VERSION="0.16.13"
PKG_URL="https://github.com/libretro/ludo/releases/download/v$PKG_VERSION/Ludo-Linux-$ARCH-$PKG_VERSION.tar.gz"
PKG_SOURCE_NAME="Ludo-Linux-$ARCH-$PKG_VERSION.tar.gz"
PKG_TOOLCHAIN="manual"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libX11 libXext libdrm libXrandr libXcursor"
elif [ "$DISPLAYSERVER" = "weston" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET wayland waylandpp"
  CFLAGS="$CFLAGS -DMESA_EGL_NO_X11_HEADERS"
  CXXFLAGS="$CXXFLAGS -DMESA_EGL_NO_X11_HEADERS"
fi

if [ ! "$OPENGL" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL"
fi

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp ./ludo $INSTALL/usr/bin/ludo
  mkdir -p $INSTALL/usr/share/ludo
    cp -r ./assets $INSTALL/usr/share/ludo/assets
    cp -r ./database $INSTALL/usr/share/ludo/database
  mkdir -p $INSTALL/usr/lib/libretro
    cp -r ./cores/* $INSTALL/usr/lib/libretro

  mkdir -p $INSTALL/etc
    echo '
video_fullscreen = true
cores_dir = "/usr/lib/libretro"
assets_dir = "/usr/share/ludo/assets"
database_dir = "/usr/share/ludo/database"
playlists_dir = "/storage/playlists"
savefiles_dir = "/storage/savefiles"
savestates_dir = "/storage/savestates"
screenshots_dir = "/storage/screenshots"
system_dir = "/storage/system"
thumbnail_dir = "/storage/thumbnails"
bluetooth_service = false
samba_service = false
ssh_service = false
' > $INSTALL/etc/ludo.toml
}

post_install() {
  enable_service ludo.target
  enable_service ludo.service
}
