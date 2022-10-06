{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    theme = ./rosepinemoon.rasi;
  };
}
