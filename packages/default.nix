{ lib, pkgs, ... }:

[
  (import ./framework-grub.nix { inherit lib pkgs;})
]
