{ config, inputs, pkgs, ... }:

{
  imports = [
    ./light.nix
    ./pipewire.nix
  ];
}
