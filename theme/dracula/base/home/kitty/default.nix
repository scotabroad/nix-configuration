{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Dracula";
    settings = {
      background_opacity = "0.9";
    };
  };
}
