# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

let
  # dpi adjustment calculations
  monitorHeight = 2256; #in pixels
  monitorWidth  = 1504; #in pixels
  monitorHeightInches = 11.25; #285 mm;
  monitorWidthInches  = 7.5;   #190.5 mm;
  newDPI = builtins.ceil ((monitorHeight / monitorHeightInches) + (monitorWidth / monitorWidthInches)) / 2; #Looking at a DPI of 201

in {
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Boot Options
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages; # Latest LTS

    # Boot Loader settings
    loader = {
      # EFI settings
      efi = {
        efiSysMountPoint = "/boot";
	canTouchEfiVariables = false;
      };

      # Use the GRUB 2 boot loader.
      grub = {
        enable = true;
        backgroundColor = "#2f302f";
	device = "nodev"; # "nodev" for efi only
        efiInstallAsRemovable = true;
        efiSupport = true;
        # Define on which hard drive you want to install Grub.
        font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/'Ubuntu Mono Nerd Font Complete Mono.ttf'";
        fontSize = 28;
        theme = pkgs.framework-grub-theme;
	# splashImage = null;
	splashMode = "normal";
        useOSProber = false; # enable only if dual booting
        version = 2;
      };

      # Disable systemd-boot
      systemd-boot.enable = false;
    };
  };

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
    # Select internationalization properties for tty console
    # keyMap = "us";
    # useXkbConfig = true; # use xkbOptions in tty.
  };

  # Set up Environment
  environment = {
    # Select default shells
    shells = [ pkgs.zsh ];
    
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [
      curl
      firefox
      git
      htop
      lightlocker
      networkmanager
      networkmanagerapplet
      vim
      xmobar
      wget
      which
      unzip
      zip
    ];
    
    # Environment Variables for DPI fixes
    variables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1"; # 2 ruins MARS MIPS, have to do 1 as only accepts intergers
      _JAVA_AWT_WM_NONREPARENTING= "1"; # MATLAB Fix
    };
  };

  # Install custom fonts system-wide
  fonts.fonts = [
    pkgs.terminus_font
    pkgs.nerdfonts
    pkgs.ubuntu_font_family
  ];

  # 2nd step taffybar fix
  gtk.iconCache.enable = true;
 
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "ibus";
      #package = pkgs.ibus-with-plugins;
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
    
    # Enable steam hardware
    steam-hardware.enable = true;

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
    
    # Enable backlight
    light.enable = true;

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

    # Configure steam, which requires 32-bit libraries
    steam = {
      enable = true;
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
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
    printing.enable = true;  
  
    # Configure backlight
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
    
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      # Uncomment below to disable X server on boot
      # autorun = false; #Must run systemctl start display display-manager.service
      dpi = newDPI; #HiDPI fix, may need to adjust number
      # Video Drivers can be specified here
      # videoDrivers = [ "r128" ]; # this is for xf86-video-r128, might need this for xorg-x11-dev-intel
      displayManager = {
        defaultSession = "none+xmonad";
        lightdm = {
          background = ./wallpaper/Nordic.jpg;
          extraSeatDefaults = ''
            greeter-wrapper = ${pkgs.lightdm-dpi-fix}
          '';
	  greeters.gtk = {
            enable = true;
	    clock-format = "%l:%M %p";
	    cursorTheme = {
	      name = "Nordzy-dark";
	      size = 48;
	      package = pkgs.nordzy-icon-theme;
	    };
	    iconTheme = {
	      name = "Nordzy-dark";
	      package = pkgs.nordzy-icon-theme;
	    };
	    indicators = [
	      "~host"
	      "~spacer"
	      "~session"
	      "~a11y"
	      "~clock"
	      "~power"
	    ];
	    theme = {
	      name = "Nordic";
	      package = pkgs.nordic;
	    };
	    extraConfig = ''
              font-name=Ubuntu,11
            '';
          };
        };
	# 1st step taffybar workaround
	sessionCommands = ''
	  systemctl --user import-environment GDK_PIXBUF_MODULE_FILE DBUS_SESSION_BUS_ADDRESS PATH
	'';
      };

      # 3rd step taffybar workaround
      gdk-pixbuf.modulePackages = [ pkgs.librsvg ];
 
      # Configure keymap in X11
      layout = "us";
      
      # Enable touchpad support (enabled default in most desktopManager).
      libinput = {
        enable = true;
        mouse = {
          accelProfile = "flat";
	  accelSpeed = null;
	  disableWhileTyping = true;
        };
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
     
      # Keyboard Layout switching
      # xkbOptions = {
      #   "caps:escape" # map caps to escape.
      #   "eurosign:e";
      # };
    }; # end Xserver config
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
    extraGroups = [ "wheel" "video" ]; # Enable ‘sudo’ for the user.
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
      (import ./taffybar/overlay.nix)
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

