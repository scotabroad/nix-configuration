{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "firefox-yaru-theme";
  version = "125";

  src = fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "firefox-gnome-theme";
    rev = "v${version}";
    hash = "sha256-N1BmvredC7xfZhobNOog0+0KrbGXPbQmmmWHT1eOoBw=";
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
