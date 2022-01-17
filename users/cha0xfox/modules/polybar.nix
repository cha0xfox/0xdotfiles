{ config, pkgs, ... }:
{
    services.polybar = {
        enable = true;
        config = ./configs/polybar/forest/preview.ini;
        script = "polybar top &";
    };
}