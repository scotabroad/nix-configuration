{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/fog_forest_1.png
    wallpaper = , ${pkgs.custom-wallpapers}/fog_forest_1.png
  '';
}
