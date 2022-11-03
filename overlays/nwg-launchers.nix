{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "nwg-piotr";
      repo = "nwg-launchers";
      rev = "e9d2a88acd4c68cd2883a29a07eb9141aaa2ba4b";
      sha256 = "u6ftRHjjjWUSH6Cc1elW4VOfVE3HYMva2qW9x5lg79w=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];
  });
}
