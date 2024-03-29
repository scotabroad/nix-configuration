{ lib, pkgs }:

[
  (final: prev: {
    custom-wallpapers = prev.callPackage ./custom-wallpapers.nix {};
    firefox-gnome-theme = prev.callPackage ./firefox-gnome-theme.nix {};
    firefox-yaru-theme = prev.callPackage ./firefox-yaru-theme.nix {};
    framework-grub-theme = pkgs.callPackage ./framework-grub.nix {};
    nixos-grub-theme = prev.callPackage ./nixos-grub.nix {};
  })
  # For now, scripts will be packaged using the old format
  (import ./trim-generations { inherit pkgs; })
  
  # These more complex packages override packages or scopes
  # For now, they remain as individual overlays
  (import ./vim-lexurgy.nix { inherit pkgs; })
]
