{ pkgs, ... }:

{
  services.redshift = {
    enable = true;
    tray = true;
    latitude  = "55";
    longitude = "37";
  };
}
