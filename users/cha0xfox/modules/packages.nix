{ config, pkgs, lib, ... }:

let
        localPkgs = import ../packages { pkgs = pkgs; };
in
{

  home = {
    packages = with pkgs; [
        obsidian
        #pscircle
        #reaper
        ripcord
        #wmctrl
        #spotify
        bat
        betterdiscordctl
        bitwarden
        btrfs-progs
        copyq
        discocss
        discord
        element-desktop
        ffmpeg
        gimp
        gnome3.adwaita-icon-theme
        gromit-mpx
        imagemagick
        lens
        liquidprompt
        mailspring
        mumble
        ncmpcpp
        neofetch
        parted
        pandoc
        polybar
        qjackctl
        ripgrep
        tdesktop
        virt-viewer
        libfm
        pcmanfm
        gvfs
        xmobar
        ytmdl
        zathura
        zoom-us
        spice-gtk
        (emacsWithPackages (epkgs: [
          epkgs.neotree
        ]))
    ] ++ [
     #localPkgs.boomer
    ];
  };

}



