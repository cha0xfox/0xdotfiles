{ config, pkgs, lib, ... } @ args: let
  swayidleCfg = config.systemd.user.services.swayidle.Install.WantedBy;
  in {
  home.packages = with pkgs [hyprland];

  xdg.configFile."hypr/hyprland.conf".text = import ./config.nix args;

  systemd.user.targets.hyprland-session = {
    Unit = {
      Description = "hyprland compositor session";
      Documentation = ["man:systemd.special(7)"];
      BindsTo = ["graphical-session.target"];
      Wants = ["graphical-session-pre.target"];
      After = ["graphical-session-pre.target"];
    };
  };
}