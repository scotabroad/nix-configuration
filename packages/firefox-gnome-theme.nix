{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "firefox-gnome-theme";
  version = "135";

  src = fetchFromGitHub {
    owner = "rafaelmardojai";
    repo = "${pname}";
    rev = "v${version}";
    hash = "sha256-OtF9hFsFXLpCpz5Oy+I7yAE6GgenpFEzUXTc9AtoZQk=";
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
