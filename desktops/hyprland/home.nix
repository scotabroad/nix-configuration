{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./programs
    ./services
    ./theme
  ];

  home.packages = with pkgs; [
    grim
    gnome.nautilus
    hyprpaper
  ];
}
