{ config, inputs, pkgs, ... }:

{
  home.file.".config/waybar/hyprland.css".source = ./style.css;
}
