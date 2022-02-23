# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstableTarball = 
    fetchTarball 
      https://github.com/NixOs/nixpkgs/archive/nixos-unstable.tar.gz;

in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/desktop.nix
      ./modules/xserver.nix
      ./modules/virtualization.nix
      ./modules/latex.nix
      ./modules/samba.nix
    ];
  
  nixpkgs.config.packageOverrides = pkgs: {
    unstable = import unstableTarball {
      config = config.nixpkgs.config;
    };
  };

  nixpkgs.config.allowUnfree = true;
  
  ##BOOT

  boot = {
  kernelPackages = pkgs.linuxPackages_xanmod;
  loader.systemd-boot.enable = true;
  loader.efi.canTouchEfiVariables = true;

  kernelParams = [ "intel_iommu=on" "kvm.ignore_msrs=1" "kvm.allow_unsafe_interrupts=1" ];
  kernelModules = [ "kvm-intel" "v4l2loopback" ];
  extraModulePackages = [
      config.boot.kernelPackages.v4l2loopback
    ];
  initrd.availableKernelModules = [ "vfio-pci" ];

  initrd.preDeviceCommands = ''
  DEVS="0000:68:00.0 0000:68:00.1"
  for DEV in $DEVS; do
    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
  done
  modprobe -i vfio-pci
  '';
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking = {
    hostName = "0x";
    hostId = "ef44cfcc";
    firewall.enable = false;
    useDHCP = false;
    defaultGateway = "192.168.88.1";
    nameservers = [ "192.168.88.10" "1.1.1.1" ];
    bridges.br0.interfaces = [ "enp5s0" ];
    #interfaces.enp5s0.useDHCP = true;
    #interfaces.br0.useDHCP = true;
    interfaces.br0.ipv4.addresses = [
      { 
      address = "192.168.88.111"; 
      prefixLength = 24; 
      }
    ];
  };


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
   };

  # Enable sound.
  sound.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    config.pipewire = {
      "context.properties" = {
      #"default.clock.rate" = 192000;
      };
    };
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cha0xfox = {
     isNormalUser = true;
     initialPassword = "toor";
     extraGroups = [ "wheel" "cdrom" "disk" "audio" "libvirtd" "docker" "input" ]; # Enable ‘sudo’ for the user.
  };

  services.gnome.gnome-keyring.enable = true;
  security = {
    pam.services.login.enableGnomeKeyring = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nano # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    firefox
  ];

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    settings.trusted-users = [ "cha0xfox" "root" ];
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

