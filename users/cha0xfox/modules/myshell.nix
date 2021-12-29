{ config, pkgs, ... }:

{

  programs.fish = {
    enable = true;
    shellAliases = {
        mpvp = "mpv --no-video --loop";
        barrierrun = "barriers -f --no-tray --name 0x --disable-crypto -c ~/.config/barrier.conf";
        ytdownload = "youtube-dl -x --audio-format mp3";
    };
    plugins = [
    ];
  };

  home.packages = with pkgs; [
      fishPlugins.done
      fishPlugins.pisces
      fishPlugins.fzf-fish
      fishPlugins.foreign-env
  ];

  programs.dircolors = {
    enable = true;
  };

}
