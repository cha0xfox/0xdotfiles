{ config, pkgs, ... }:

{
  imports = [
  ./modules/picom.nix
  ./modules/xmonad.nix
  #./modules/windowmanager.nix
  ./modules/dunst.nix
  ./modules/packages.nix
  ./modules/myshell.nix
  ./modules/xsession.nix
  ./modules/filemap.nix
  ./modules/services.nix
  ./modules/programs.nix
  #./modules/sway.nix
  ./modules/configs/xresources.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cha0xfox";
  home.homeDirectory = "/home/cha0xfox";
  home.sessionVariables.EDITOR = "nvim";

  home.keyboard = {
    layout = "us,ru";
    options = [ "ctrl:nocaps" "grp:alt_shift_toggle" ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
