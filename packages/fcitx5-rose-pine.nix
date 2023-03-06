{ stdenv }:

stdenv.mkDerivation rec {
  pname = "fcitx5-rose-pine";
  version = "unstable";

  src = ./fcitx5-rose-pine;

  installPhase = ''
    cp -r $src $out
  '';
}
