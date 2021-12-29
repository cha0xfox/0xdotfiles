#!/bin/sh
pushd ~/0xdotfiles
home-manager switch --max-jobs 12 -f ./users/cha0xfox/home.nix
popd
