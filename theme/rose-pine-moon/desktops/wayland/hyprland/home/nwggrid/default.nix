{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwggrid/hyprland.css".source = ./style.css;
}
