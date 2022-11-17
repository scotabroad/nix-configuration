{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "nwg-piotr";
      repo = "nwg-launchers";
      rev = "70f3390625c61ddf70ed688e36b64f434616a487";
      sha256= "g453c9rrgibFcOIaTIGqKo1mVFypyfirFfdZpt4dKYg=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];
  });
}
