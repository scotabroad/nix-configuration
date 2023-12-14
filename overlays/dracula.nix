{ pkgs, ... }:

final: prev: {
  dracula-theme = prev.dracula-theme.overrideAttrs (oldAttrs: {
    pname = "dracula-theme";
    version = "unstable-2023-12-08";

    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "gtk";
      rev = "0b64e1108f4a222d40b333435a41d9f1963a3326";
      hash = "sha256-SQHfHNE6OURAPYX5+0WLkm2sivWIrP0mMgkU+GZCCho=";
    };
  });
}
