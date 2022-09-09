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
        ark   
        obsidian
        #pscircle
        #reaper
        #ripcord
        #wmctrl
        spotify
        bat
        betterdiscordctl
        #stable.bottles
        bitwarden
        btrfs-progs
        copyq
        coreutils-prefixed
        conky
        carla
        #google-chrome
        discocss
        stable.discord
        element-desktop
        ffmpeg
        flameshot
        gimp
        gnome3.adwaita-icon-theme
        gromit-mpx
        imagemagick
        # teams
        #lens
        liquidprompt
        mailspring
        meld
        mumble
        ncmpcpp
        neofetch
        nitrogen
        parted
        pandoc
        polybar
        qjackctl
        ripgrep
        tdesktop
        virt-viewer
        libfm
        rocketchat-desktop
        pcmanfm
        gvfs
        xmobar
        ytmdl
        stable.zathura
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



