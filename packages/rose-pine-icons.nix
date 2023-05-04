{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "rose-pine-icon-theme";
  version = "unstable-2022-09-01";

  src = fetchFromGitHub {
    owner = "rose-pine";
    repo = "gtk";
    rev = "7a4c40989fd42fd8d4a797f460c79fc4a085c304";
    sha256 = "x8SH/d1/mslB2b8fcWrlVu0VDtBYjwjOqd5Lnb3k5GA=";
  };

  dontPatch = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cd $src/icons
    cp -r * $out/share/icons
  '';

  meta = with lib; {
    description = "Rosé Pine theme for GTK";
    homepage = "https://github.com/rose-pine/gtk";
    platforms = platforms.linux;
    maintainers = [ maintainers.scotabroad ];
  };
}
