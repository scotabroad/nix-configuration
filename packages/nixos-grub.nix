{ fetchFromGitHub, lib, stdenv }:

stdenv.mkDerivation rec {
  pname = "nixos-grub-theme";
  version = "3.2";

  src = fetchFromGitHub {
    owner = "AdisonCavani";
    repo = "distro-grub-themes";
    rev = "ebbd17419890059e371a6f2dbf2a7e76190327d4";
    hash = "sha256-FWkDtoLMTTk2Lz4d4LkFjtV/xYyIlpwZlX5Np1QhXls=";
  };

  installPhase = ''
    mkdir -p $out
    cp $src/themes/nixos.tar $out
    cd $out
    tar -xf nixos.tar
    rm nixos.tar
  '';

  meta = with lib; {
    description = "A pack of GRUB2 themes for different Linux distrutions and OSs";
    longDescription = '' 
      A pack of GRUB2 themes for different Linux distributions and OSs.
      It aims to replace the default GRUB look, with a nice and colorful theme.
    '';
    homepage = "https://github.com/AdisonCavani/distro-grub-themes";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = [ maintainers.scotabroad ];
  };
}
