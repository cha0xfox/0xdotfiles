{ config, pkgs, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    evdev
    tkinter
    pillow
    # other python packages you want
  ]; 
  python-with-my-packages = python3.withPackages my-python-packages;
in

{

  environment.systemPackages = with pkgs; [
    ntfs3g
    cv
    unar unzip p7zip
    xclip
    youtube-dl
    lm_sensors
    htop
    fd fzf
    bpytop
    linuxPackages.cpupower
    pcmanfm
    git
    dconf
    feh sxiv
    pulsemixer
    pciutils
    virt-viewer
    barrier
    mpv
    helvum
    chromium
    maim
    deluge
    openconnect
    vscode
    obs-studio
    python
    gitstatus
    ghc
    easyeffects
    python-with-my-packages
    libcap
    thunderbird
    alacritty
    libwacom
    xf86_input_wacom
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
  };

}
