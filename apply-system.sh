#!/bin/sh
pushd ~/0xdotfiles
nixos-rebuild switch --max-jobs 12 --flake .# --use-remote-sudo
popd
