#!/bin/bash

notify-send -t 3000 "Playing Video" "$(xclip -o)";
mpv --volume=25 --geometry=600x400 "$(xclip -o)"
