{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
  (import ./waybar.nix { inherit pkgs; })
]
