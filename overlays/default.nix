{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./nwg-launchers.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
]
