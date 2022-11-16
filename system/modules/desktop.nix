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
    kubectl
    helm
    minikube

    alacritty
    kitty

    barrier
    bpytop
    busybox
    chromium
    cifs-utils
    dconf
    direnv
    distrobox
    stable.easyeffects
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
    ranger
    #w3m
    ueberzug
    xdragon
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
    stable.iosevka
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

  services.openssh = {
  enable = true;
  # require public key authentication for better security
  passwordAuthentication = false;
  kbdInteractiveAuthentication = false;
  #permitRootLogin = "yes";
  };

  users.users."cha0xfox".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsQp4GdMOir4z9AEZYkbUFkry2SQF7pKTwnDdeocEpf8OHBfxSyFSwMi1FM6cx/xmGHnLmnl5K82iFNpsc4ecJi5faRyEt397GAOfTVRb1ab55OQPBb89JQ/JYFEsuMNBVLaSJ9RFESLgp++2M7Vaq/tbumuQAOdUdIUwFS1ZBABSeKKUm1ILayj38CHxSX7+ZM7syF8ZLEE3m/CqdW2kAMqD4451vmOLbrr7MqjxxYiaFgfM8SpFKXYTybas27+NeYc5wkAIeO/OQzoqMnCXf7t4GbNxgQdNP6YJRPzgplUMrmxfIs+78EoMwI2/uLyCvHAPqAKV0ImI3m3x7Yuyf cha0xfox"
  ];
}
