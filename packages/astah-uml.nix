{ lib, pkgs, ... }:

final: prev: {
  astah-uml = final.stdenv.mkDerivation rec {
    pname = "astah-uml";
    version = "8.5.0";

    src = ./astah-uml-8_5_0-39c620.zip;

    nativeBuildInputs = with pkgs; [
      jdk8
      jre8
      unzip
    ];

    installPhase = ''
      mkdir -p $out
      cp $src $out
      cd $out
      unzip $src
      cd astah_uml
      chmod 755 astah
    '';
  };
}
