{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./nord.rasi;
  };
}
