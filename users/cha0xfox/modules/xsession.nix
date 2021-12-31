{config, pkgs, ...}:
{

  xsession = {
    enable = true;

    pointerCursor ={
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
    };
    initExtra = ''
    xset -dpms s off
    xsetroot -cursor_name capitaine-cursors

    nvidia-settings -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=50'
    '';
  };


  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font.name = "FiraCode";
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}