{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwgbar/hyprland.json".source = ./bar.json;
}
