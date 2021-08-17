# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="linux-utils"
PKG_VERSION="2.36.1"
PKG_SHA256="09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
PKG_LICENSE="GPL"
PKG_URL="http://www.kernel.org/pub/linux/utils/util-linux/v${PKG_VERSION%.*}/util-linux-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="gcc:host ncurses:host"
PKG_DEPENDS_TARGET="toolchain ncurses:target"
PKG_DEPENDS_INIT="toolchain"
PKG_LONGDESC="A large variety of low-level system utilities that are necessary for a Linux system to function."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+pic:host"

UTILLINUX_CONFIG_DEFAULT="--disable-gtk-doc \
                          --disable-nls \
                          --disable-rpath \
                          --enable-tls \
                          --disable-all-programs \
                          --enable-setterm \
                          --enable-chsh-only-listed \
                          --disable-bash-completion \
                          --disable-colors-default \
                          --disable-pylibmount \
                          --disable-pg-bell \
                          --disable-use-tty-group \
                          --disable-makeinstall-chown \
                          --disable-makeinstall-setuid \
                          --disable-widechar \
                          --with-gnu-ld \
                          --without-selinux \
                          --without-audit \
                          --without-udev \
                          --with-ncurses \
                          --without-ncursesw \
                          --without-readline \
                          --without-slang \
                          --without-tinfo \
                          --without-utempter \
                          --without-util \
                          --without-libz \
                          --without-user \
                          --without-systemd \
                          --without-smack \
                          --without-python \
                          --without-systemdsystemunitdir"

PKG_CONFIGURE_OPTS_TARGET="$UTILLINUX_CONFIG_DEFAULT \
                           --enable-libuuid \
                           --enable-libblkid \
                           --enable-libmount \
                           --enable-libsmartcols \
                           --enable-losetup \
                           --enable-fsck \
                           --enable-fstrim \
                           --enable-blkid"

PKG_CONFIGURE_OPTS_HOST="--enable-static \
                         --disable-shared \
                         $UTILLINUX_CONFIG_DEFAULT \
                         --enable-uuidgen \
                         --enable-libuuid"

PKG_CONFIGURE_OPTS_INIT="$UTILLINUX_CONFIG_DEFAULT \
                         --enable-libblkid \
                         --enable-libmount \
                         --enable-fsck"

pre_configure_target() {
  export LDFLAGS="${LDFLAGS} -lncurses -ltinfo"
}

makeinstall_target() {
mkdir -p $INSTALL/usr/bin
cp $PKG_BUILD/.$TARGET_NAME/setterm $INSTALL/usr/bin
}
