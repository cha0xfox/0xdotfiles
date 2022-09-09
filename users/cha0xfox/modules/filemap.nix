{config, pkgs, ...}:
{
  xdg.configFile."alacritty/alacritty.yml".source = ./configs/alacritty.yml;
  #xdg.configFile."kitty/kitty.conf".source = ./configs/kitty.conf;
  home.file.".inputrc".source = ./configs/inputrc;
  home.file.".xmobarrc".source = ./configs/xmobarrc;
  home.file.".config/conky/.conkyrc".source = ./configs/conky/.conkyrc;
  home.file.".config/conky/cpu_network.lua".source = ./configs/conky/cpu_network.lua;
  #xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
}
