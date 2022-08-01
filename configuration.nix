# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  
  # dpi adjustment calculations
  monitorHeight = 2256; #in pixels
  monitorWidth  = 1504; #in pixels
  monitorHeightInches = 11.25; #285 mm;
  monitorWidthInches  = 7.5;   #190.5 mm;
  newDPI = builtins.ceil ((monitorHeight / monitorHeightInches) + (monitorWidth / monitorWidthInches)) / 2; #Looking at a DPI of 201

in {
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/framework>
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages; # Latest LTS

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "nodev"; # "nodev" for efi only
  boot.loader.systemd-boot.enable = true;

  console.colors = [
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

  #Enable Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  # Enable all hardware
  # hardware.enableAllFirmware = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # bigger tty fonts
  console.font =
    "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";

  # Install custom fonts system-wide
  fonts.fonts = [
    pkgs.ubuntu_font_family
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    dpi = newDPI; #HiDPI fix, may need to adjust number
    # Video Drivers can be specified here
    # videoDrivers = [ "r128" ]; # this is for xf86-video-r128, might need this for xorg-x11-dev-intel
    displayManager = {
      defaultSession = "none+xmonad";
      setupCommands = ''
	xrandr --output eDP-1 --mode 2256x1504 --dpi 201 &
      '';
      lightdm.greeters.gtk = {
        enable = true;
	cursorTheme = {
	  name = "Nordzy-dark";
	  size = 48;
	  package = unstable.nordzy-icon-theme;
	};
	theme = {
	  name = "Nordic";
	  package = unstable.nordic;
	};
	iconTheme = {
	  name = "Nordzy-dark";
	  package = unstable.nordzy-icon-theme;
	};
	extraConfig = ''
          font-name=Ubuntu,11
        '';
      };
    };

    # Need one desktop manager or window manager, otherwise stuck with xterm
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad
	haskellPackages.xmonad-contrib
	haskellPackages.xmonad-extras
      ];
    };
    # Configure keymap in X11
    layout = "us";
    # xkbOptions = {
    #   "eurosign:e";
    #   "caps:escape" # map caps to escape.
    # };
    # Uncomment below to disable X server on boot
    # autorun = false; #Must run systemctl start display display-manager.service
    # Enable touchpad support (enabled default in most desktopManager).
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        accelSpeed = null;
        additionalOptions = "";
        buttonMapping = null;
        calibrationMatrix = null;
        clickMethod = "clickfinger";
        dev = null;
        disableWhileTyping = true;
        horizontalScrolling = true;
        leftHanded = false;
        middleEmulation = false;
        naturalScrolling = true;
        scrollButton = null;
        scrollMethod = "twofinger";
        sendEventsMode = "enabled";
        tapping = false;
        tappingDragLock = false;
        transformationMatrix = "3 0 0 0 3 0 0 0 1";
      };
      mouse = {
        accelProfile = "flat";
	accelSpeed = null;
	disableWhileTyping = true;
      };
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Avahi to discover network devices
  services.avahi.enable = true;

  # Zsh
  environment.shells = [ pkgs.zsh ];

  # Environment Variables
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    # QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  # Was not available in NixOS 20.03, is in Unstable, but this is 22.05... does the same as some earlier fixes
  hardware.video.hidpi.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  sound.mediaKeys.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liamdp = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "video" ]; # Enable ‘sudo’ for the user.
    createHome = true;
    home = "/home/liamdp";
    shell = pkgs.zsh;
    packages = with pkgs; [
      flameshot
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     curl
     dmenu
     dunst
     git
     htop
     firefox
     lightlocker
     networkmanager
     networkmanagerapplet
     vim
     xmobar
     wget
     which
   ];

  # Switch out sudo for doas
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "liamdp" ];
    keepEnv = true;
    persist = true;
  }];

  #Set neovim as default editor
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
  };

  # Configure backlight
  programs.light.enable = true;
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  # Enable flakes
  # nix = {
  #   package = pkgs.nixUnstable;
  #   extraOptions = ''
  #     experimental-features = nix-command flakes
  #   '';
  #   useSandbox = true;
  #   gc = {
  #     automatic = true;
  #     dates = "*:0/10";
  #   };
  # };
  # systemd.services.nix-gc.unitConfig.ConditionACPower = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  # Enables non-free packages (still need to be configured on a per-user basis in ~/.config/nixpkgs/config.nix
  nixpkgs.config = {
    allowUnfree = true;
    
    # Enable Unstable Packages via an alias
    #packageOverrides = pkgs: {
    # unstable = import <nixos-unstable> {
    #   config = config.nixpkgs.config; # ensures allowUnfree = true; is propagated
    # };
    #};
  };
  nixpkgs.system = "x86_64-linux";


  # List services that you want to enable:

  # Enable Firmware Update Daemon
  services.fwupd.enable = true;
  # Now run "sudo fwupdmgr update"


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

