{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage emacs
  programs.emacs = {
    enable = true;
  };
}
