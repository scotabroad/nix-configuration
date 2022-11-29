{ pkgs }:

final: prev: {
  fcitx5-dracula-theme = prev.stdenv.mkDerivation rec {
    pname = "fcitx5-dracula-theme";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "drbbr";
      repo = "fcitx5-dracula-theme";
      rev = "e27e1cb31048f2d002fc39c89c8440381a4ba3c1";
      sha256 = "1S/FEEbCpqH4A4DXl4kH/bQ1uEaQCPf96NTGyb7Vogs=";
    };

    installPhase = ''
      mkdir $out
      cp -r * $out
    '';

    patches = [./fcitx5-dracula-theme.patch];
  };
}
