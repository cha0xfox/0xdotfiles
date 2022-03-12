{config, pkgs, ...}:

{

  programs.sway = {
  enable = true;
  wrapperFeatures.gtk = true; # so that gtk works properly
  extraPackages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard
    mako # notification daemon
    alacritty # Alacritty is the default terminal in the config
    dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
  ];
  };

  environment = {
    etc = {
      # Put config files in /etc. Note that you also can put these in ~/.config, but then you can't manage them with NixOS anymore!
      "sway/config".source = ../../users/cha0xfox/modules/configs/sway.conf;
      "xdg/waybar/config".source = ../../users/cha0xfox/modules/configs/waybar_conf.conf;
      "xdg/waybar/style.css".source = ../../users/cha0xfox/modules/configs/waybar_style.css;
    };
  };

  systemd.user.targets.sway-session = {
    description = "Sway compositor session";
    documentation = [ "man:systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };

  programs.waybar.enable = true;
  programs.xwayland.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [
      "amd"
    ];
  };

}
