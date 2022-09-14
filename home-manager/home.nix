{ config, inputs, pkgs, ... }:

{

  imports = [
    ../desktops/pantheon/home.nix
    ./programs
    #./services
    ./dconf.nix
    ./theme.nix
  ];

  # Enable dconf
  dconf.enable = true;
  
  # Additional Packages
  home = {
    homeDirectory = "/home/liamdp";
    packages = with pkgs; [
      # Personal
      discord
      element-desktop
      eww
      gnome.dconf-editor
      gnome.gedit
      gtk-engine-murrine
      imagemagick
      libreoffice
      nord-gedit
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
    username = "liamdp";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
