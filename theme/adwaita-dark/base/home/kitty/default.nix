{ config, inputs, pkgs, lib, home-manager, ... }:

{
  # Manage kitty
  programs.kitty = {
    theme = "Adwaita dark";
    settings = {
      background_opacity = "0.9";
    };
    font = {
      name = "SauceCodePro Nerd Font Mono";
      package = pkgs.nerdfonts;
    };
  };
}
