{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    libinput.mouse.accelProfile = "flat";
    layout = "us,ru";
    xkbOptions = "grp:alt_shift_toggle";
    libinput.mouse.accelSpeed = "0";
    inputClassSections = [ ''
      Identifier "My Mouse"
      MatchIsPointer "yes"
      Option "AccelerationProfile" "-1"
      Option "AccelerationScheme" "none"
      Option "AccelSpeed" "-1"
    '' ];


    #displayManager.sddm.enable = true;
    #displayManager.sddm.theme = "abstractdark-sddm-theme";
    #windowManager.awesome.enable = true;

  displayManager = {
        defaultSession = "none+xmonad";
        lightdm.greeters.mini = {
          enable = true;
          user = "cha0xfox";
          extraConfig = ''
            [greeter-theme]
            background-image = "";
            background-color = "#0C0F12"
            text-color = "#ff79c6"
            password-background-color = "#1E2029"
            window-color = "#181a23"
            border-color = "#bd93f9"
          '';
        };
      };

  windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

    dpi = 96;
    deviceSection = ''
    Option "Coolbits" "28"
    '';

    screenSection = ''
    Option         "metamodes" "DVI-D-0: nvidia-auto-select +4480+840 {rotation=right, ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+1080 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-1: nvidia-auto-select +2240+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, DP-2: nvidia-auto-select +0+1260 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    Option         "AllowIndirectGLXProtocol" "Off"
    Option         "TripleBuffer" "On"
    '';
  };

  #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

}
