{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwggrid/grid.conf".source = ./grid.conf;
  home.file.".config/nwg-launchers/nwggrid/terminal".source = ./terminal;
}
