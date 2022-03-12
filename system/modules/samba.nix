{ config, pkgs, ... }:
{
services.samba = {
  enable = true;
  securityType = "user";
  extraConfig = ''
    workgroup = WORKGROUP
    server string = smbnix
    netbios name = smbnix
    security = user 
    #use sendfile = yes
    #max protocol = smb2
    #hosts allow = 192.168.0  localhost
    #hosts deny = 0.0.0.0/0
    guest account = nobody
    map to guest = bad user
  '';
  shares = {
    public = {
      path = "/DATA_2/Share";
      browseable = "yes";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0777";
      "directory mask" = "0777";
    };
  };
};

fileSystems."/mnt/Documents" = {
  device = "//192.168.88.11/Documents";
  fsType = "cifs";
  options = let
    # this line prevents hanging on network split
    automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5sfile_mode=0770,dir_mode=0770,nounix,uid=1000,gid=100";

  in ["${automount_opts},credentials=/home/cha0xfox/0xdotfiles/secrets/smb-secrets,rw"];
  };

fileSystems."/mnt/FileShare" = {
  device = "//192.168.88.11/NASDATA";
  fsType = "cifs";
  options = let
    # this line prevents hanging on network split
    automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5sfile_mode=0770,dir_mode=0770,nounix,uid=1000,gid=100";

  in ["${automount_opts},credentials=/home/cha0xfox/0xdotfiles/secrets/smb-secrets,rw"];
  };
}
