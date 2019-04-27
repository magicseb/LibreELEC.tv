#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

# Script to suspend/resume audio and freeze/unfreeze the Kodi process

. /etc/profile
oe_setup_addon service.rr-config-tool

kodi_freeze() {
  if [ "$1" = "muteonly" ]; then
    kodi-send --action="RunScript(/usr/bin/audio-suspend.py)"
  else
    systemctl stop kodi
    wait $(pidof kodi.bin)
    usleep 500000
    load_pulseaudio_sink
    usleep 500000
    start_FluidSynth_backend
  fi
}

kodi_freeze_noPA() {
  if [ "$1" = "muteonly" ]; then
    kodi-send --action="RunScript(/usr/bin/audio-suspend.py)"
  else
    systemctl stop kodi
    wait $(pidof kodi.bin)
  fi
}


kodi_unfreeze() {
  if [ "$1" = "muteonly" ]; then
    kodi-send --action="RunScript(/usr/bin/audio-resume.py)"
  else
    stop_FluidSynth_backend
    usleep 500000
    unload_pulseaudio_sink
    wait $(pidof pactl)
    usleep 500000
    systemctl start kodi
  fi
}

kodi_unfreeze_noPA() {
  if [ "$1" = "muteonly" ]; then
    kodi-send --action="RunScript(/usr/bin/audio-resume.py)"
  else
    usleep 500000
    systemctl start kodi
  fi
}

case $1 in
  freeze)
    if [ ! -f /tmp/.kodifreeze ]; then
      pidof kodi.bin > /dev/null && KODI=1
      if [ "$KODI" = "1" ]; then
        kodi_freeze $2
        touch /tmp/.kodifreeze
      else
        echo "Kodi isn't running, nothing to do."
      fi
    else
      echo "Kodi already frozen, nothing to do."
    fi
    ;;
  freeze_noPA)
    if [ ! -f /tmp/.kodifreeze ]; then
      pidof kodi.bin > /dev/null && KODI=1
      if [ "$KODI" = "1" ]; then
        kodi_freeze_noPA $2
        touch /tmp/.kodifreeze
      else
        echo "Kodi isn't running, nothing to do."
      fi
    else
      echo "Kodi already frozen, nothing to do."
    fi
    ;;
  unfreeze)
    if [ -f /tmp/.kodifreeze ]; then
      kodi_unfreeze $2
      rm /tmp/.kodifreeze
    else
      echo "Kodi isn't frozen, nothing to do."
    fi
    ;;
  unfreeze_noPA)
    if [ -f /tmp/.kodifreeze ]; then
      kodi_unfreeze_noPA $2
      rm /tmp/.kodifreeze
    else
      echo "Kodi isn't frozen, nothing to do."
    fi
    ;;
  *)
    echo "Usage: $0 [freeze|unfreeze|freeze_noPA|unfreeze_noPA] [muteonly]"
    ;;
esac
