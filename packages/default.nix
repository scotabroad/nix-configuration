{ lib, pkgs }:

[
  (final: prev: {
    custom-wallpapers = prev.callPackage ./custom-wallpapers.nix {};
    everforest-gtk-theme = prev.callPackage ./everforest-gtk.nix {};
    everforest-icon-theme = prev.callPackage ./everforest-icons.nix {};
    fcitx5-dracula = pkgs.callPackage ./fcitx5-dracula.nix {};
    fcitx5-nord = pkgs.callPackage ./fcitx5-nord.nix {};
    fcitx5-rose-pine = pkgs.callPackage ./fcitx5-rose-pine.nix {};
    framework-grub-theme = pkgs.callPackage ./framework-grub.nix {};
    nixos-grub-theme = prev.callPackage ./nixos-grub.nix {};
    regreet-git = prev.callPackage ./regreet-git.nix {};
    rose-pine-gtk-theme = prev.callPackage ./rose-pine-gtk.nix {};
    rose-pine-icon-theme = prev.callPackage ./rose-pine-icons.nix {};
  })
  # For now, scripts will be packaged using the old format
  (import ./hyprland-close.nix { inherit pkgs; })
  (import ./lightdm-dpi-fix.nix { inherit pkgs; })
  (import ./trim-generations { inherit pkgs; })
  
  # These more complex packages override packages or scopes
  # For now, they remain as individual overlays
  (import ./dracula-gedit.nix { inherit lib pkgs; })
  (import ./everforest-gedit.nix { inherit lib pkgs; })
  (import ./nord-gedit.nix { inherit lib pkgs; })
  (import ./vim-lexurgy.nix { inherit pkgs; })
  (import ./yuck-vim.nix { inherit pkgs; })
]
