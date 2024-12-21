{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./gnome-aisleriot.nix { inherit pkgs; })
  #(import ./gnome-mutter.nix { inherit pkgs; }) #While patch is for 47.3, nixos-unstable has 47.3, patch manages dependencies differently than nixos-unstable
  (import ./gnome-terminal.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
]
