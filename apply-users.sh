#!/bin/sh
pushd ~/0xdotfiles
rm /home/cha0xfox/.xmonad/xmonad-x86_64-linux
home-manager switch --max-jobs 12 --flake .#cha0xfox
popd
