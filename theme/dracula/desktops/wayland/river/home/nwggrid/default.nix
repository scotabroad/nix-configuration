{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwggrid/river.css".source = ./style.css;
}
