{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./gnome-aisleriot.nix { inherit pkgs; })
  #(import ./gnome-mutter.nix { inherit pkgs; }) #Version mismatch... patch is for 47.1, nixos-unstable has 47.0
  #(import ./gnome-terminal.nix { inherit pkgs; }) #Version mismatch... patch is for 3.54.1, nixos-unstable has 3.52.2
  (import ./steam.nix { inherit pkgs; })
]
