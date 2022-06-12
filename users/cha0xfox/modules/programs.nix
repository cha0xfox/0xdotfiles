{ pkgs, lib, ... }:
{
    programs = {
        obs-studio = {
            enable = true;
            plugins = with pkgs.stable.obs-studio-plugins; [ obs-ndi ];
        };

        neovim = {
            enable = true;
            plugins = with pkgs.vimPlugins; [ vim-nix ];
        };

        rofi = {
            enable = true;
            terminal = "alacritty";
            #configPath = "/home/cha0xfox/0xdotfiles/users/cha0xfox/modules/programs/rofi/rofi.rasi";
            theme = "/home/cha0xfox/0xdotfiles/users/cha0xfox/modules/programs/rofi/theme.rasi";
        };  
    };
}
