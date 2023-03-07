{ fetchFromGitHub, stdenv }:

stdenv.mkDerivation rec {
  pname = "fcitx5-rose-pine";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "rose-pine";
    repo = "fcitx5";
    rev = "148de09929c2e2f948376bb23bc25d72006403bc";
    sha256 = "SpQ5ylHSDF5KCwKttAlXgrte3GA1cCCy/0OKNT1a3D8=";
  };

  installPhase = ''
    mkdir $out
    cp -r rose-pine* $out
  '';
}
