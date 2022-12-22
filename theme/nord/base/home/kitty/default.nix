{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Nord";
    settings = {
      background_opacity = "0.9";
    };
  };
}
