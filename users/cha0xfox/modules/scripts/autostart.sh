#!/bin/sh
pkill polybar;
polybar top --config='~/0xdotfiles/users/cha0xfox/modules/configs/polybar/forest/preview.ini' &
polybar bottom --config='~/0xdotfiles/users/cha0xfox/modules/configs/polybar/forest/preview.ini' &