#!/bin/env/ bash
pw-link easyeffects_sink:monitor_FL easyeffects_source:input_FL &
pw-link easyeffects_sink:monitor_FR easyeffects_source:input_FR &
mpv --volume=100 --audio-device=pulse/easyeffects_sink /home/cha0xfox/Soundboard/$1 2>&1 &