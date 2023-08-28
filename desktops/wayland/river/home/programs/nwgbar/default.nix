{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwgbar/river.json".source = ./bar.json;
}
