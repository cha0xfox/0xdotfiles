{config, pkgs, ...}:

{

home.packages = with pkgs; [
    libnotify
];

services.dunst = {
    enable = true;
    settings = {
        global = {
            font = "FiraCode Nerd Font 12";
            markup = "yes";
            format = ''
                %a
                <b>%s</b>
                %b'';
            word_wrap = "yes";
            stack_duplicates = "yes";
            hide_duplicates_count = "no";
            geometry = "500x10-0+0";
        };
        urgency_low = {
            frame_color = "#1D918B";
            foreground = "#FFEE79";
            background = "#18191E";
            #timeout = 5;
        };

        urgency_normal = {
            frame_color = "#D16BB7";
            foreground = "#FFEE79";
            background = "#18191E";
            #timeout = 10;
        };

        urgency_critical = {
            frame_color = "#FC2929";
            foreground = "#FFFF00";
            background = "#18191E";
            #timeout = 10;
        };
    };
};

}
