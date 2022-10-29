{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "nwg-piotr";
      repo = "nwg-launchers";
      rev = "771a06e1690f0f2743c8738151cf6ea71d0884e8";
      sha256 = "GHnmn8CdpemrpB3+IxFbbry7fjAJGjc7PUeSYxZrNM4=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];

    patches = (oldAttrs.patches or []) ++ [
      ./nwg-launchers.patch
    ];
  });
}
