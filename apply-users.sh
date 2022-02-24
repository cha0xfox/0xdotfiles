#!/bin/sh
pushd ~/0xdotfiles
home-manager switch --max-jobs 12 --flake .#cha0xfox
popd