{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "scotabroad";
      repo = "nwg-launchers";
      rev = "3387d9cd499c9319072ddc41ca32ac5a955a2dc1";
      sha256 = "S6LEX74Zztvt7Di4VJq9gi91g6XjiReSfhCQQiJxe88=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];

    #patches = (oldAttrs.patches or []) ++ [
    #  ./nwg-launchers.patch
    #];
  });
}
