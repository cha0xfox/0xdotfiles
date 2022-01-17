{ config, pkgs, ... }:
{
    services.polybar = {
        enable = true;
        config = ./configs/polybar/polybar.conf;
        script = "polybar bar &";
    };
}