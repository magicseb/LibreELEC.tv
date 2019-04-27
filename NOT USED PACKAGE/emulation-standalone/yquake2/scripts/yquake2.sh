#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

. /etc/profile

if [ ! -L /storage/.yq2 ]; then
  ln -s /storage/.config/games/yquake2 /storage/.yq2
fi

# Freeze Kodi / stop audio
kodifreeze.sh freeze

# Set OpenAL audio driver to Pulseaudio or ALSA
set_OpenAL_audiodriver

# Set SDL audio driver to PulseAudio or ALSA
set_SDL_audiodriver

quake2 "$@" > /var/log/yquake2.log 2>&1

# Set OpenAL audio driver to ALSA
rm /storage/.alsoftrc

# Switch back to Frontends or unfreeze Kodi & start audio
pidof emulationstation > /dev/null 2>&1 || pidof pegasus-fe > /dev/null 2>&1 || kodifreeze.sh unfreeze
