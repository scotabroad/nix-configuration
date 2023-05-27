{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Everforest Dark Hard";
    settings = {
      background_opacity = "0.9";
    };
  };
}
