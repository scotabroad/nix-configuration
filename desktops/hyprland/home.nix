{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./programs
    ./services
  ];

  home.packages = with pkgs; [
    grim
    gnome.nautilus
    hyprpaper
  ];
}
