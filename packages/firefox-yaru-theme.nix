{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "firefox-yaru-theme";
  version = "122";

  src = fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-yaru-theme";
    rev = "v${version}";
    hash = "sha256-QZk/qZQVt1X53peCqB2qmWhpA3xtAVgY95pebSKaTFU=";
  };

  patches = [ ./firefox-yaru-theme.patch ];

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out
  '';

  meta = with lib; {
    description = "An Ubuntu Yaru theme for Firefox";
    longDescription = ''
      An Ubuntu Yaru theme for Firefox;
    '';
    homepage = "https://github.com/rafaelmardojai/firefox-gnome-theme";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ maintainers.scotabroad ];
  };
}
