{ config, pkgs, lib, ... }:

let
  unstableTarball = 
    fetchTarball 
      https://github.com/NixOs/nixpkgs/archive/nixos-unstable.tar.gz;

  localPkgs = import ../packages { pkgs = pkgs; };
in
{

  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import unstableTarball {
      config = config.nixpkgs.config;
    };
  };

  home = {
    packages = with pkgs; [
        gnome3.adwaita-icon-theme
        bat
        xmobar
        ncmpcpp
        ffmpeg
        discocss
        unstable.discord
        obsidian
        qjackctl
        tdesktop
        gromit-mpx
        spotify
        parted
        btrfs-progs
        liquidprompt
        lens
        reaper
        pfetch
        pscircle
        polybar
        zathura
        bitwarden
        ripcord
        wmctrl
        betterdiscordctl
        imagemagick
        #razergenie openrazer-daemon
        #(pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
        #  dfVersion = "0.47.05";
        #  enableIntro = false;
        #  enableFPS = true;
        #})
    ] ++ [
     #localPkgs.boomer
    ];
  };

}



