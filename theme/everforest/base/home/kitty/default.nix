{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    font = {
      name = "Ubuntu Mono Nerd Font Mono";
      package = pkgs.nerdfonts;
    };
    theme = "Everforest Dark Hard";
    settings = {
      background_opacity = "0.9";
    };
  };
}
