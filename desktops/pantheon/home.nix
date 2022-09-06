{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs
    ./dconf.nix
  ];
}
