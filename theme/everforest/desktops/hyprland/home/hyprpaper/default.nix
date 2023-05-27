{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/fog_forest_1.png
    wallpaper = eDP-1,${pkgs.custom-wallpapers}/fog_forest_1.png
    wallpaper = DP-4,${pkgs.custom-wallpapers}/fog_forest_1.png
  '';
}
