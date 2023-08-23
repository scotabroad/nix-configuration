{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/winter-in-bohemia.png
    wallpaper = , ${pkgs.custom-wallpapers}/winter-in-bohemia.png
  '';
}
