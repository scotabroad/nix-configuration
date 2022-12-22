{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Rosé Pine Dawn";
    settings = {
      background_opacity = "0.75";
    };
  };
}
