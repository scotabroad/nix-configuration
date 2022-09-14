{ pkgs, ... }:

[
  (import ./discord.nix { inherit pkgs; })
  (import ./gtksourceview.nix { inherit pkgs; })
]
