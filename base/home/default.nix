{ config, inputs, pkgs, ... }:

{

  imports = [
    ./dconf
    ./programs
    ./users
  ];

  # Enable dconf
  dconf.enable = true;
  
  # Additional Packages
  home = {
    packages = with pkgs; [
      # Personal
      discord
      element-desktop
      libreoffice
      scarab
      trim-generations
      vivaldi
      vlc
    ];

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

  manual.manpages.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
