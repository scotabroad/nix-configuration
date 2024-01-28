{ pkgs, ... }:

final: prev: {
  dracula-theme = prev.dracula-theme.overrideAttrs (oldAttrs: {
    pname = "dracula-theme";
    version = "unstable-2024-01-25";

    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "gtk";
      rev = "ed505cce4b61831765a128ebb544edf040f57be5";
      hash = "sha256-jPZabinmQMCtBPj/P3vuqb3OCUbx9OAuCoar7ZnegPQ=";
    };
  });
}
