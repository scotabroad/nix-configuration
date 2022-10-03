{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home.packages = with pkgs; [
    gnome.nautilus
    hyprpaper
  ];
}
