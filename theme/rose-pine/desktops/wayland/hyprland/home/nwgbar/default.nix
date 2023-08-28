{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwgbar/hyprland.css".source = ./style.css;
}
