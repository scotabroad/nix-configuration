{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    theme = ./nord.rasi;
  };
}
