{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    font = {
      name = "Ubuntu Mono Nerd Font Mono";
      package = pkgs.nerdfonts;
    };
    theme = "Nord";
    settings = {
      background_opacity = "0.9";
    };
  };
}
