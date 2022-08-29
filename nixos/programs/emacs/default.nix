{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage emacs
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ 
      epkgs.nord-theme
    ];
  };
}
