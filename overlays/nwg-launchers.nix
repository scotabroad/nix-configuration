{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "nwg-piotr";
      repo = "nwg-launchers";
      rev = "6ada38ed4e95b41cecadf77a55cdb1a109c407be";
      sha256 = "3TaAfuzwVFRdFTQQ0nCaGumgnlnawjHILOP5W8k8WeM=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];

    patches = (oldAttrs.patches or []) ++ [
      ./nwg-launchers.patch
    ];
  });
}
