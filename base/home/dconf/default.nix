{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ./gedit.nix
    ./ibus.nix
  ];
}
