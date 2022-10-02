{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    font = {
      size = 21; #Only for xmonad, may split this file later
    };
  };
}
