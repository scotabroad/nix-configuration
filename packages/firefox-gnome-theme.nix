{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "firefox-gnome-theme";
  version = "125";

  src = fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-N1BmvredC7xfZhobNOog0+0KrbGXPbQmmmWHT1eOoBw=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out
  '';

  meta = with lib; {
    description = "A GNOME theme for Firefox";
    longDescription = ''
      A GNOME theme for Firefox;
    '';
    homepage = "https://github.com/rafaelmardojai/firefox-gnome-theme";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ maintainers.scotabroad ];
  };
}
