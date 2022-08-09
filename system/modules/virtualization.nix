{ config, lib, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  virt-manager
  looking-glass-client
  scream
  OVMFFull
];

virtualisation.libvirtd = {
  enable = true;
  qemu.ovmf.enable = true;
  qemu.ovmf.packages = [ pkgs.OVMFFull ];
  qemu.swtpm.enable = true;
  qemu.runAsRoot = true;
  onBoot = "ignore";
  onShutdown = "shutdown";
};

hardware.opengl.driSupport32Bit = true;

virtualisation.docker = {
enable = true;
enableNvidia = true;
};

systemd.tmpfiles.rules = [
  "f /dev/shm/looking-glass 0660 cha0xfox qemu-libvirtd -"
  "f /dev/shm/scream 0660 cha0xfox qemu-libvirtd -"
];

}
