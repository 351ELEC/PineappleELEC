# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present AmberELEC (https://github.com/AmberELEC)

PKG_NAME="theodore"
PKG_VERSION="7889613edede5ba89de1dfe7c05cf8397cf178ba"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Zlika/theodore"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Libretro core for Thomson MO/TO emulation / Core Libretro pour l'émulation des ordinateurs Thomson MO/TO."
PKG_TOOLCHAIN="make"

make_target() {
  make platform=unix
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/libretro
  cp ${PKG_BUILD}/theodore_libretro.so ${INSTALL}/usr/lib/libretro
}
