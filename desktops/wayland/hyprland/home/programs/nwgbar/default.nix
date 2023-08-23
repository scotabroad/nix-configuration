{ config, inputs, pkgs, ... }:

{
  home.file.".config/nwg-launchers/nwgbar/bar.json".source = ./bar.json;
}
