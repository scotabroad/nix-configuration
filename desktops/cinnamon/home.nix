{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../programs/cinnamon.nix
    ../../services/cinnamon.nix
  ];

}
