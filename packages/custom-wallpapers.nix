{ pkgs }:

final: prev: {
  custom-wallpapers = final.stdenv.mkDerivation rec {
    pname = "custom-wallpapers";
    version = "unstable";
    
    src = ../wallpapers;

    installPhase = ''
      cp -r $src $out
    '';
  };
}
