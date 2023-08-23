{ config, inputs, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${pkgs.custom-wallpapers}/dracula-base.png
    wallpaper = , ${pkgs.custom-wallpapers}/dracula-base.png
  '';
}
