{ pkgs, ... }:

final: prev: {
  nwg-launchers = prev.nwg-launchers.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "scotabroad";
      repo = "nwg-launchers";
      rev = "ebcaf1f1f3478407f05cb48be4bb365df797e616";
      sha256 = "KB19LTjtgsJ6Z3kLlddpdqD/lr0ClpwfPP7fWjv+UdQ=";
    };

    buildInputs = oldAttrs.buildInputs ++ [
      pkgs.librsvg
    ];

    #patches = (oldAttrs.patches or []) ++ [
    #  ./nwg-launchers.patch
    #];
  });
}
