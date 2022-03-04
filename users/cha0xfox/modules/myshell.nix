{ config, pkgs, ... }:

{

  programs.fish = {
    enable = true;
    shellAliases = {
        mpvp = "mpv --no-video --loop";
        barrierrun = "barriers -f --no-tray --name 0x --disable-crypto -c ~/.config/barrier.conf";
        ytdownload = "youtube-dl -x --audio-format mp3";
        apply-users = "~/0xdotfiles/apply-users.sh";
        apply-system = "~/0xdotfiles/apply-system.sh";
        update-users = "~/0xdotfiles/update-users.sh";
        update-system = "~/0xdotfiles/update-system.sh";
        soundboard = "python3 ~/0xdotfiles/users/cha0xfox/modules/scripts/kbd.py";
        macrorun = "python3 ~/0xdotfiles/users/cha0xfox/modules/scripts/kbd_wrk.py";
        hackit = "docker run --rm -it bcbcarl/hollywood";
        myneofetch = "neofetch --ascii ~/0xdotfiles/users/cha0xfox/modules/configs/ascii-art.txt --ascii_colors 1";
        doom = "~/.emacs.d/bin/doom";
        runarch = "distrobox-enter Arch -- zsh";
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
