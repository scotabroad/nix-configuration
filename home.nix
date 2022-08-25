{ config, inputs, pkgs, ... }:

{

  imports = [
    ./programs/exa
    ./programs/feh
    ./programs/git
    ./programs/kitty
    ./programs/neovim
    ./programs/rofi
    ./programs/zsh
    
    ./services/dunst
    ./services/flameshot
    ./services/network-manager-applet
    ./services/picom
    ./services/status-notifier-watcher
    ./services/taffybar

  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamdp";
  home.homeDirectory = "/home/liamdp";

  # Manage eww
  #programs.eww = {
  #  enable = true;
  #  configDir = /home/liamdp/.config/eww;
  #  package = unstable.eww;
  #};
  
  # Enable dconf
  dconf.enable = true;
  
  # Manage Gtk Themes
  gtk = {
    enable = true;
    
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };

    gtk3.extraConfig = {
      #gtk-icon-theme-name = "Nordzy-dark";
      #gtk-theme-name = "Nordic";
      gtk-application-prefer-dark-theme = 0;
    };
  };

  # Additional Packages
  home.packages = with pkgs; [
    # Personal
    cinnamon.nemo
    discord
    element-desktop
    eww
    gnome.gedit
    gtk-engine-murrine
    imagemagick
    libreoffice
    #trayer
    trim-generations
    wallpaper
    vivaldi

    #School
    gcc11
    javaPackages.junit_4_12
    jdk8
    jre8
    mars-mips
    octaveFull
  ];

  systemd.user = {
    services = {
      ibus = {
        Unit = {
	  Description = "ibus daemon";
	  After = ["tray.target"];
	};
	Service = {
	  ExecStart = "${pkgs.ibus}/bin/ibus-daemon -drxR";
	};
      };
    };
    targets = {
      tray = {
        Unit = {
          Description = "tray target";
          Requires = ["graphical-session-pre.target"];
	};
      };
    };
  };

  xsession = {
    preferStatusNotifierItems = true; # For taffybar sni tray
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad/xmonad.hs;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
