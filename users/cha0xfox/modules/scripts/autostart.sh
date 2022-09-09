#!/bin/sh
pkill polybar;
pkill copyq;
pkill flameshot;
pkill conky;

wait 2;
copyq &
flameshot &
polybar top --config='~/0xdotfiles/users/cha0xfox/modules/configs/polybar/forest/preview.ini' &
polybar bottom --config='~/0xdotfiles/users/cha0xfox/modules/configs/polybar/forest/preview.ini' &
conky -c ~/.config/conky/.conkyrc &


#sh -c "telegram-desktop  & sleep 5 && wmctrl -i -r `wmctrl -l | grep Telegram` -t 0"
#sh -c "Discord  & sleep 5 && wmctrl -i -r `wmctrl -l | grep Discord` -t 2"
#sh -c "easyeffects  & sleep 5 && wmctrl -i -r `wmctrl -l | grep EasyEffects` -t 6"
#sh -c "alacritty -e 'bpytop' & sleep 5 && wmctrl -i -r `wmctrl -l | grep BpyTOP` -t 6"
#sh -c "alacritty -e 'pulsemixer' & sleep 5 && wmctrl -i -r `wmctrl -l | grep pulsemixer` -t 6"
#sh -c "thunderbird & sleep 5 && wmctrl -i -r `wmctrl -l | grep Thunderbird` -t 15"
