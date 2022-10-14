{ pkgs, ... }:

final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "5da45ece9dd7d2738a866f115ce40e4758f4ac2b";
      sha256 = "O870s/aj/xVO5CHAYMbdYCX3luNNiz31JF3skn/3mUA=";
    };
    mesonFlags = oldAttrs.mesonFlags ++ [
      "-Dexperimental=true"
      "-Djack=disabled"
      ];
  });
}
