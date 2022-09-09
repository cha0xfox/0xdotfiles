#!/bin/sh
pushd ~/0xdotfiles
rm /home/cha0xfox/.xmonad/xmonad-x86_64-linux
export NIXPKGS_ALLOW_UNFREE=1
home-manager switch --max-jobs 12 --flake .#cha0xfox --impure
popd
