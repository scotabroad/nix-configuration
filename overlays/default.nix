{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./dracula.nix { inherit pkgs; })
  (import ./nordic.nix { inherit pkgs; })
  (import ./steam.nix { inherit pkgs; })
]
