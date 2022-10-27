{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "nwg-piotr";
      repo = "nwg-launchers";
      rev = "29ee3b0501ebc7524eb43ba8a28375f811925d3c";
      sha256 = "+waoJHU/QrVH7o9qfwdvFTFJzTGLcV9CeYPn3XHEAkM=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];
  });
}
