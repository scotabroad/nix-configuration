{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Rosé Pine";
    settings = {
      background_opacity = "0.9";
    };
  };
}
