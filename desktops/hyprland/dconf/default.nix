{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {

  imports = [
    ./desktop.nix
  ];
}
