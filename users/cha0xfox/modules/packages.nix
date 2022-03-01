{ config, pkgs, lib, ... }:

let
  localPkgs = import ../packages { pkgs = pkgs; };
in
{

  home = {
    packages = with pkgs; [
        gnome3.adwaita-icon-theme
        bat
        xmobar
        ncmpcpp
        ffmpeg
        discocss
        discord
        #obsidian
        qjackctl
        tdesktop
        gromit-mpx
        spotify
        parted
        btrfs-progs
        liquidprompt
        lens
        #reaper
        neofetch
        #pscircle
        polybar
        zathura
        bitwarden
        #ripcord
        #wmctrl
        betterdiscordctl
        imagemagick
        mailspring
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



