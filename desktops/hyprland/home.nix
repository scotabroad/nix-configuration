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
    fuzzel
    gnome.nautilus
    grim
    hyprpaper
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
