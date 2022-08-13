{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
]
