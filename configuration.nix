# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  
  imports = [
    ./boot/efi.nix
    ./desktops/xserver.nix
    ./fonts.nix
    ./theme.nix
    ./hardware-configuration.nix
    ./programs/steam.nix
  ];

  # tty console settings
  console = {
    # Enable Nord theme
    colors = [
      "3b4252"
      "bf616a"
      "a3be8c"
      "ebcb8b"
      "81a1c1"
      "b48ead"
      "88c0d0"
      "e5e9f0"
      "4c566a"
      "bf616a"
      "a3be8c"
      "ebcb8b"
      "81a1c1"
      "b48ead"
      "8fbcbb"
      "eceff4"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  # Set up Environment
  environment = {
    # Needed for wingpanel-indicator-ayatana
    pathsToLink = [ "/libexec" ];

    # Select default shells
    shells = [ pkgs.zsh ];
    
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      curl
      firefox
      git
      htop
      indicator-application-gtk3 # Needed for wingpanel-indicator-ayatana
      lightlocker # Would this interfere with GNOME or Cinnamon... RESEARCH!!!
      networkmanager
      networkmanagerapplet
      vim
      wget
      which
      unzip
      zip
    ];
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
	table
	table-others
      ];
    };
  };
  
  # Hardware settings
  hardware = {
    # Enable sound
    pulseaudio.enable = true;
    
    # Was not available in NixOS 20.03, is in Unstable, but this is 22.05... does the same as some earlier fixes
    video.hidpi.enable = true;
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

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };
  };
  
  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liamdp = {
    createHome = true;
    extraGroups = [ "wheel" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
    home = "/home/liamdp";
    isNormalUser = true;
    shell = pkgs.zsh;
    uid = 1000;
  };

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
    overlays = with inputs; [
      (import ./config/taffybar/overlay.nix)
    ];
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

