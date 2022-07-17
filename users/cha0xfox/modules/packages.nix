{ config, pkgs, lib, ... }:

let
        localPkgs = import ../packages { pkgs = pkgs; };
in
{

  home = {
    packages = with pkgs; [
        # --- for wayland

        # grim 
        # slurp
        # swaybg
        # swaylock-effects
        # wl-clipboard
        # wlr-randr
        # wlogout
        # wofi

        # ---       
        obsidian
        #pscircle
        #reaper
        ripcord
        #wmctrl
        #spotify
        bat
        betterdiscordctl
        bottles
        bitwarden
        btrfs-progs
        copyq
        carla
        discocss
        stable.discord
        element-desktop
        ffmpeg
        gimp
        gnome3.adwaita-icon-theme
        gromit-mpx
        imagemagick
        # teams
        #lens
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
        vopono
        # zoom-us
        spice-gtk
        (emacsWithPackages (epkgs: [
          epkgs.neotree
        ]))
    ] ++ [
     #localPkgs.boomer
    ];
  };

}



