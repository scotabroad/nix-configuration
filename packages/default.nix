{ lib, pkgs, ... }:

[
  (import ./custom-wallpapers.nix { inherit pkgs; })
  (import ./dracula-gedit.nix { inherit lib pkgs; })
  (import ./framework-grub.nix { inherit lib pkgs; })
  (import ./fcitx5-dracula-theme.nix { inherit pkgs; })
  (import ./lightdm-dpi-fix.nix { inherit pkgs; })
  (import ./nixos-grub.nix { inherit lib pkgs; })
  (import ./nord-gedit.nix { inherit lib pkgs; })
  (import ./rose-pine-gtk.nix { inherit lib pkgs; })
  (import ./rose-pine-icons.nix { inherit lib pkgs; })
  (import ./trim-generations { inherit pkgs; })
  (import ./waybar-pipewire { inherit pkgs; })
  (import ./wallpaper.nix { inherit pkgs; })
  (import ./wayland-gtk-fix.nix { inherit pkgs; })
  (import ./yuck-vim.nix { inherit pkgs; })
]
