{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/winter-in-bohemia.png
    wallpaper = eDP-1,${pkgs.custom-wallpapers}/winter-in-bohemia.png
    wallpaper = DP-4,${pkgs.custom-wallpapers}/winter-in-bohemia.png
  '';
}
