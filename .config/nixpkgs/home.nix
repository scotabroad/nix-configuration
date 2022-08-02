{ config, inputs, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  
  wallpaper = pkgs.writeShellScriptBin "wallpaper" ''
    #!${pkgs.zsh}

    #variable=$(command -args)
    #args come in the form of $1, $2, etc.

    #check if $1 exists, quit if no
    #[[ ]] is a file in for 'test'
    #Use [ ] to be portable with older shells
    #test -e returns true if file exists
    #test -f returns true only if file is a regular file and not a directory or device
    if [[ -f "$1" ]]; then
      #set wallpaper
      ln -sf $1 $HOME/Wallpaper && feh --bg-fill --no-fehbg $HOME/Wallpaper
    else
      echo "$1 does not exist"
    fi
  '';
in {

  imports = [
    ./programs/zsh
    ./programs/neovim
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamdp";
  home.homeDirectory = "/home/liamdp";

  # Manage picom
  services.picom = {
    enable = true;
    inactiveOpacity = "1.00";
    activeOpacity = "1.00";
    backend = "glx";
    experimentalBackends = false;
    shadow = false;
    # extraOptions = ''
    #   corner-radius = 15
    # '';
    vSync = true;
  };

  # Manage eww
  programs.eww = {
    enable = true;
    configDir = ../eww;
    package = unstable.eww;
  };

  # Manage kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = "Ubuntu Mono Nerd Font Complete Mono";
      package = pkgs.nerdfonts;
      size = 24;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+x" = "copy_and_clear_or_interrupt";
    };
    settings = {
	background_opacity = "0.9";
    };
    theme = "Nord";
  };

  # Manage git
  programs.git = {
    enable = true;
    userName = "Liam Petrie";
    userEmail = "liamdpetrie@vivaldi.net";
    extraConfig = { 
      core = { 
        editor = "nvim"; 
      };
      init = { 
        defaultBranch = "main";
      };
    };
  };
  
  dconf.enable = true;
  
  # Manage exa
  programs.exa = {
    enable = true;
    enableAliases = false; # interferes with a zsh plugin, zpm-zsh/ls
  };

  # Manage feh
  programs.feh = {
    enable = true;
  };
  
  # Manage Gtk Themes
  gtk = {
    enable = true;
    
    theme = {
      name = "Nordic";
      package = unstable.nordic;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = unstable.nordzy-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Nordzy-dark";
      gtk-theme-name = "Nordic";
      gtk-application-prefer-dark-theme = 0;
    };
  };

  # Additional Packages
  home.packages = with pkgs; [
    cinnamon.nemo
    discord
    element-desktop
    gnome.gedit
    gtk-engine-murrine
    imagemagick
    libreoffice
    trayer
    wallpaper
    unstable.vivaldi
  ];

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
