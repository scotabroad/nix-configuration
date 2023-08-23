{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
    wallpaper = , ${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
  '';
}
