{ config, inputs, pkgs, ... }:

{

  imports = [
    ./programs
    ./dconf
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
      gnome.aisleriot
      gnome.dconf-editor
      gnome.eog
      gnome.evince
      gnome.gedit
      libreoffice
      trim-generations
      vivaldi

      #School
      gcc11
      gnumake
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
