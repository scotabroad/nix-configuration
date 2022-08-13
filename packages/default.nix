{ lib, pkgs, ... }:

[
  (import ./framework-grub.nix { inherit lib pkgs; })
  (import ./trim-generations { inherit pkgs; })
]
