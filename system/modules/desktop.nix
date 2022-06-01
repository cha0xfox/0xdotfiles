{ config, pkgs, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    evdev
    tkinter
    pillow
    pynput
    #pyautogui
    # other python packages you want
  ]; 
  python-with-my-packages = python3.withPackages my-python-packages;
in

{

  environment.systemPackages = with pkgs; [
    alacritty
    barrier
    bpytop
    busybox
    chromium
    dconf
    direnv
    easyeffects
    fd fzf
    feh sxiv
    ghc
    git
    gitstatus
    helvum
    htop
    libcap
    libwacom
    linuxPackages.cpupower
    lm_sensors
    maim
    mpv
    nix-prefetch-git
    ntfs3g
    openconnect
    openvpn
    pciutils
    #pcmanfm
    progress
    pulsemixer
    python-with-my-packages
    radeon-profile
    # thunderbird
    unar unzip p7zip
    vscode
    xclip
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xf86_input_wacom
    #youtube-dl
    yt-dlp
  ];

  fonts.fonts = with pkgs; [
    liberation_ttf
    fira
    fira-code
    fira-code-symbols
    inconsolata-nerdfont
    powerline-fonts
    proggyfonts
    mononoki
    font-awesome
    iosevka
    (nerdfonts.override { fonts = [ "FiraCode" "Iosevka" ]; })
  ];

  environment.variables.EDITOR = "nvim";

  programs = {
    bash.enableCompletion = true;
    tmux.enable = true;
    neovim.defaultEditor = true;
    steam.enable = true;
  };

  xdg.portal.enable = true;

  services = {
    #some services
  };
}
