{ lib, pkgs, ... }:

[
  (import ./framework-grub.nix { inherit lib pkgs; })
  (import ./lightdm-dpi-fix.nix { inherit pkgs; })
  (import ./nord-gedit.nix { inherit lib pkgs; })
  (import ./trim-generations { inherit pkgs; })
  (import ./wallpaper.nix { inherit pkgs; })
]
