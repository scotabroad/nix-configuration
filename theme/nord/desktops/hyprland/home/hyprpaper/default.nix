{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/Nordic.jpg
    wallpaper = eDP-1,${pkgs.custom-wallpapers}/Nordic.jpg
    wallpaper = DP-4,${pkgs.custom-wallpapers}/Nordic.jpg
  '';
}
