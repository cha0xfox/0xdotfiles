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

}