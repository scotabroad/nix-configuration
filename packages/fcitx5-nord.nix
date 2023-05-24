{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "fcitx5-nord";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "tonyfettes";
    repo = "fcitx5-nord";
    rev = "bdaa8fb723b8d0b22f237c9a60195c5f9c9d74d1";
    sha256 = "qVo/0ivZ5gfUP17G29CAW0MrRFUO0KN1ADl1I/rvchE=";
  };

  installPhase = ''
    mkdir $out
    cp -r Nord-* $out
  '';
}
