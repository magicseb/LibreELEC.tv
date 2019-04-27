#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

. /etc/profile

# Freeze Kodi / stop audio
kodifreeze.sh freeze

# Change refresh rate to 60Hz
set_refresh_rate_60

# Set audio backend to PulseAudio or ALSA
set_SDL_audiodriver

/usr/bin/retroarch.start -L /tmp/cores/2048_libretro.so

# Switch back to Frontends or unfreeze Kodi & start audio
pidof emulationstation > /dev/null 2>&1 || pidof pegasus-fe > /dev/null 2>&1 || kodifreeze.sh unfreeze
