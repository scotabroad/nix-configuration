{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./edusong.nix { inherit pkgs; })
  (import ./gnome-aisleriot.nix { inherit pkgs; })
  (import ./gnome-terminal.nix { inherit pkgs; })
  (import ./rime-data.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
]
