{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/Nordic.jpg
    wallpaper = , ${pkgs.custom-wallpapers}/Nordic.jpg
  '';
}
