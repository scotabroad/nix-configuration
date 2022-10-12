{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./desktop
    ./config.nix
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
    systemdIntegration = true;
  };
}
