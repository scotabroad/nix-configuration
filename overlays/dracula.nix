{ pkgs, ... }:

final: prev: {
  dracula-theme = prev.dracula-theme.overrideAttrs (oldAttrs: {
    pname = "dracula-theme";
    version = "unstable-2024-02-16";

    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "gtk";
      rev = "0be7ae81dc1c15887146db802884aa56f3d92751";
      hash = "sha256-PmCJg/mE4mZ7KLljH4ZQou0zsaOo80z19XSmKCjojuw=";
    };
  });
}
