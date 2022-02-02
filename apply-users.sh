#!/bin/sh
echo "removing old xmonad binary"
rm ~/.xmonad/xmonad-x86_64-linux
pushd ~/0xdotfiles
home-manager switch --max-jobs 12 -f ./users/cha0xfox/home.nix -b backup
popd
