#!/bin/sh
pushd ~/git/MyNixConfig
sudo nixos-rebuild switch --max-jobs 12 -I nixos-config=./system/configuration.nix
popd
