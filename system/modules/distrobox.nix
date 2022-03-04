{ config, pkgs, lib, ... }:

let
  distrobox = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "distrobox";
    version = "1.2.13";

    src = pkgs.fetchgit {
      url = "https://github.com/89luca89/${pname}";
      rev = "eca80a069d6f9c71e7b5c350eae9c8ef4a0e07d2";
      sha256 = "0gs85vjrgsfxq86m2hy72h4z9i1zf6jznqmds88rnag2gxalrrk4";
    };

    phases = [ "unpackPhase" "installPhase" ];
    unpackPhase = "";

    installPhase = ''
      find . \( -not -name "distrobox-init" -and -not -name "distrobox-export" \) -type f | while read -r x; do patchShebangs "$x"; done
      mkdir -p $out/bin
      ./install -p $_
    '';
  };
in
{
    environment.systemPackages = [ pkgs.xorg.xhost distrobox ];
    virtualisation.podman.enable = true;
    environment.shellInit = ''
    [ -n "$DISPLAY" ] && xhost +si:localuser:$USER || true
    clear
    '';
}