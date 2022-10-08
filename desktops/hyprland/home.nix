{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./hyprland.conf.nix
    ./programs
    ./services
    ./theme
    inputs.hyprland.homeManagerModules.default
  ];


  home.packages = with pkgs; [
    grim
    gnome.nautilus
    hyprpaper
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = false;
  };
}
