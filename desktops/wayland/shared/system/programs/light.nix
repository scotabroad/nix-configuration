{ config, inputs, pkgs, ... }:

{
  # Enable backlight
  programs = {
    light.enable = true;
  };
}
