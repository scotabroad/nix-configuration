# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./boot/efi.nix
    ./hardware-configuration.nix
    ./programs
    ./users
    ./virtualisation.nix
  ];

  # Set up Environment
  environment = {
    # Paths to link
    pathsToLink = [ "/share/zsh" ];

    # Select default shells
    shells = [ pkgs.zsh ];
    
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      curl
      firefox
      git
      killall
      unzip
      wget
      which
      zip
    ];
  };

  fonts.packages = with pkgs; [
    #edu fonts are from Ministry of Education, ROC (Taiwan)
    eduli #clerical
    edukai #standard
    edusong #song
    nomnatong #Chữ Nôm
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    wqy_zenhei
    wqy_microhei
  ];

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
  
  # Networking Options
  networking = {
    # Firewall settings
    # firewall = {
    #   # Open ports in the firewall.
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    #   # Or disable the firewall altogether.
    #   enable = false;
    # };
    hostName = "nixos"; # Define your hostname.
    # Pick only one of the below networking options.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  # Configure default programs
  programs = {
    # Enable dconf systemwide
    dconf.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # mtr.enable = true;
    
    # Set neovim as default editor
    neovim = {
      defaultEditor = true;
      enable = true;
      viAlias = true;
      vimAlias = true;
    };

    zsh.enable = true;
  };

  # Security Options
  security.sudo.enable = true;

  # List services that you want to enable:
  services = {

    # Enable Avahi to discover network devices
    avahi.enable = true;
  
    # Enable Firmware Update Daemon
    fwupd.enable = true; # Now run "sudo fwupdmgr update"

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };
      audio.enable = true;
      jack.enable = true;
      pulse.enable = true;
      socketActivation = true;
      wireplumber.enable = true;
    };
    
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  
    #Disable Pulseaudio
    pulseaudio.enable = false;
  };
  
  # Set your time zone.
  time.timeZone = "America/Denver";

  # Enable Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  ### NIXOS SPECIFIC OPTIONS ###

  # Enable flakes
  nix = {
    package = pkgs.nix;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  #   useSandbox = true;
  #   gc = {
  #     automatic = true;
  #     dates = "*:0/10";
  #   };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
  # systemd.services.nix-gc.unitConfig.ConditionACPower = true;

  # Nixpkgs Options
  nixpkgs = {
    # Enables non-free packages (still need to be configured on a per-user basis in ~/.config/nixpkgs/config.nix
    config = {
      allowUnfree = true;
    };
    #overlays = with inputs; [
    #];
    # Nixpkgs platform
    system = "x86_64-linux";
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false; #setting this true, though helpful, impedes the purity of this function

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

