{ lib, pkgs }:

[
  (final: prev: {
    custom-wallpapers = prev.callPackage ./custom-wallpapers.nix {};
    fcitx5-dracula-theme = pkgs.callPackage ./fcitx5-dracula-theme.nix {};
    fcitx5-rose-pine = pkgs.callPackage ./fcitx5-rose-pine.nix {};
    framework-grub-theme = pkgs.callPackage ./framework-grub.nix {};
    nixos-grub-theme = prev.callPackage ./nixos-grub.nix {};
    rose-pine-gtk-theme = prev.callPackage ./rose-pine-gtk.nix {};
    rose-pine-icon-theme = prev.callPackage ./rose-pine-icons.nix {};
    sddm-git = pkgs.sddm.overrideAttrs (oldAttrs: {
      name = "sddm-git";
      version = "unstable-2022-11-23";

      src = pkgs.fetchgit {
        url = "https://github.com/sddm/sddm";
        rev = "3e486499b9300ce8f9c62bd102e5119b27a2fad1";
        sha256 = "sha256-udpWdxi6SkYrJqbJRyubmn5o3/YSVcuWW6S//jQefYI=";
      };

      patches = [];
      buildInputs =
        pkgs.libsForQt5.sddm.buildInputs
        ++ [
          pkgs.libsForQt5.layer-shell-qt
        ];
    });
  })
  # For now, scripts will be packaged using the old format
  (import ./hyprland-active { inherit pkgs; })
  (import ./hyprland-close { inherit pkgs; })
  (import ./hyprland-move { inherit pkgs; })
  (import ./hyprland-resize { inherit pkgs; })
  (import ./lightdm-dpi-fix.nix { inherit pkgs; })
  (import ./trim-generations { inherit pkgs; })
  (import ./wallpaper.nix { inherit pkgs; })
  (import ./waybar-pipewire { inherit pkgs; })
  (import ./wayland-gtk-fix.nix { inherit pkgs; })
  
  # These more complex packages override packages or scopes
  # For now, they remain as individual overlays
  (import ./dracula-gedit.nix { inherit lib pkgs; })
  (import ./nord-gedit.nix { inherit lib pkgs; })
  (import ./yuck-vim.nix { inherit pkgs; })
]
