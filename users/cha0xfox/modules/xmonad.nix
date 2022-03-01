{config, pkgs, ...}:


{

  xsession.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad.hs;
    };
  };

  #wayland.windowManager = {
  #  sway = {
  #    enable = true;
  #    config = ./configs/sway.conf
  #  };
  #};

}
