{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Rosé Pine Moon";
    settings = {
      background_opacity = "0.9";
    };
  };
}
