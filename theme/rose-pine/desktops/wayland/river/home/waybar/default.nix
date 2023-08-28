{ config, inputs, pkgs, ... }:

{
  home.file.".config/waybar/river.css".source = ./style.css;
}
