#!/bin/sh
pushd ~/0xdotfiles
sudo nixos-rebuild switch --max-jobs 12 -I nixos-config=./system/configuration.nix
popd
