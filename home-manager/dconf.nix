{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ./dconf/gedit.nix
    ./dconf/ibus.nix
  ];
}
