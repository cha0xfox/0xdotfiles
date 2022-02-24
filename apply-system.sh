#!/bin/sh
pushd ~/0xdotfiles
sudo nixos-rebuild switch --max-jobs 12 --flake .#
popd
