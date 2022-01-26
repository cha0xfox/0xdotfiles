{config, pkgs, ...}:
{
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "alsa"
        name "alsa"
        server "127.0.0.1"
      }  '';
    musicDirectory = "/DATA_2/Music";
  };

  programs.rofi = {
    enable = true;
    terminal = "xst";
    theme = "~/.config/nixpkgs/modules/programs/rofi/rofi.rasi";
  };  
/*
  systemd.user.services.pscircle = {
    Unit = {
      Description = "Pscircle wallpaper daemon";  
      Wants = "pscircle.timer";
    };
    Service = {
      Type = "simple";
      ExecStart = "/home/cha0xfox/Wallpapers/pscircle.sh";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.timers.pscircle = {
    Timer = {
      Unit = "pscircle.service";
      OnUnitActiveSec =  "10s";
    };
  };
*/
  systemd.user.services.barrier = {
    Unit = {
      Description = "Barrier daemon";  
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.barrier}/bin/barriers -f --no-tray --name 0x --disable-crypto -c /home/cha0xfox/.config/barrier.conf";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services.scream = {
    Unit = {
      Description = "Scream audio daemon";
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.scream}/bin/scream -i virbr0 -t 5";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
  
}