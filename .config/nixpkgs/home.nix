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
    ./programs/git
    ./programs/kitty
    ./programs/neovim
    ./programs/rofi
    ./programs/zsh
    ./services/dunst
    ./services/flameshot
    ./services/picom
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "liamdp";
  home.homeDirectory = "/home/liamdp";

  # Manage eww
  programs.eww = {
    enable = true;
    configDir = /home/liamdp/.config/eww;
    package = unstable.eww;
  };
  
  # Manage exa
  programs.exa = {
    enable = true;
    enableAliases = false; # interferes with a zsh plugin, zpm-zsh/ls
  };

  # Manage feh
  programs.feh = {
    enable = true;
  };

  # Enable dconf
  dconf.enable = true;
  
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
