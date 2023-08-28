{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwgbar/river.css".source = ./style.css;
}
