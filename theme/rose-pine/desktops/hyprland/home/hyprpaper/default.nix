{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
    wallpaper = eDP-1,${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
    wallpaper = DP-4,${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
  '';
}
