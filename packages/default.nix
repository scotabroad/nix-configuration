{ lib, pkgs }:

[
  (final: prev: {
    custom-wallpapers = prev.callPackage ./custom-wallpapers.nix {};
    everforest-gtk-theme = prev.callPackage ./everforest-gtk.nix {};
    everforest-icon-theme = prev.callPackage ./everforest-icons.nix {};
    framework-grub-theme = pkgs.callPackage ./framework-grub.nix {};
    nixos-grub-theme = prev.callPackage ./nixos-grub.nix {};
  })
  # For now, scripts will be packaged using the old format
  (import ./trim-generations { inherit pkgs; })
  
  # These more complex packages override packages or scopes
  # For now, they remain as individual overlays
  (import ./dracula-gedit.nix { inherit lib pkgs; })
  (import ./everforest-gedit.nix { inherit lib pkgs; })
  (import ./nord-gedit.nix { inherit lib pkgs; })
  (import ./vim-lexurgy.nix { inherit pkgs; })
  (import ./yuck-vim.nix { inherit pkgs; })
]
