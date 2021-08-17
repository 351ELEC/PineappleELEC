#!/bin/bash
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present RedWolfTech
# Copyright (C) 2020-present Fewtarius

OPENBOR="/storage/openbor"
# Create symlink to game .pak in proper location
if [ ! -d "${OPENBOR}/Paks" ]
then
  mkdir ${OPENBOR}/Paks
fi

ln -sf "${1}" /storage/openbor/Paks/Game.pak

### Maybe we can integrate this better so it uses the ES configurations
### but for now, a quick fix.

rm -f /storage/.config/retroarch/config/PPSSPP/EBOOT.cfg /storage/.config/retroarch/config/PPSSPP/PPSSPP.opt
cat <<EOF >/storage/.config/retroarch/config/PPSSPP/EBOOT.cfg
aspect_ratio_index = "7"
video_ctx_scaling = "true"
EOF

# Run retroarch PSP core and start OpenBOR engine
/usr/bin/retroarch -L /tmp/cores/ppsspp_libretro.so /storage/openbor/EBOOT.PBP

# Remove symlink to game .pak when done
rm -f /storage/openbor/Paks/Game.pak
rm -f /storage/.config/retroarch/config/PPSSPP/EBOOT.cfg
