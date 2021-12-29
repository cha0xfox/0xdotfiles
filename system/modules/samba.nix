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
}
