{ config, pkgs, lib, ... }:

let
  distrobox = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "distrobox";
    version = "1.2.13";

    src = pkgs.fetchgit {
      url = "https://github.com/89luca89/${pname}";
      rev = "872fb5fb65dcaab243e64b9357a9f0d10d2c4aab";
      sha256 = "1jf2z2jpfyzb0iqgkn8d75ij6wl4zrjb4x0s42li4vxr0i0hk3nx";
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