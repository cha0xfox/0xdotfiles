{ config, pkgs, lib, ... }:

let
  localPkgs = import ../packages { pkgs = pkgs; };
in
{

  home = {
    packages = with pkgs; [
        #obsidian
        #pscircle
        #reaper
        #ripcord
        #wmctrl
        bat
        betterdiscordctl
        bitwarden
        btrfs-progs
        discocss
        discord
        element-desktop
        ffmpeg
        gnome3.adwaita-icon-theme
        gromit-mpx
        imagemagick
        lens
        liquidprompt
        mailspring
        ncmpcpp
        neofetch
        parted
        polybar
        qjackctl
        ripgrep
        spotify
        tdesktop
        virt-viewer
        xmobar
        zathura
        (emacsWithPackages (epkgs: [
          epkgs.neotree
        ]))
    ] ++ [
     #localPkgs.boomer
    ];
  };

}



