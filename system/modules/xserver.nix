{ config, pkgs, ... }:

{

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    libinput.mouse.accelProfile = "flat";
    layout = "us,ru";
    xkbOptions = "grp:alt_shift_toggle";
    libinput.mouse.accelSpeed = "-1";
    inputClassSections = [ ''
      Identifier "My Mouse"
      MatchIsPointer "yes"
    '' ];

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
        setupCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output DisplayPort-0 --primary --mode 2560x1440 --pos 1920x1080 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 0x1212 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --pos 4480x840 --rotate right --output DisplayPort-3 --off --output DisplayPort-4 --mode 1920x1080 --pos 2092x0 --rotate normal --output DisplayPort-5 --off
          echo "1" > /sys/class/drm/card0/device/hwmon/hwmon*/pwm1_enable
          echo "90" > /sys/class/drm/card0/device/hwmon/hwmon*/pwm1
        '';
      };

  windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

    dpi = 96;
  };

}
