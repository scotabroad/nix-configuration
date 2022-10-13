{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
]
