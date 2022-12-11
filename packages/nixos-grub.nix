{ lib, pkgs, ... }:

final: prev: {
  nixos-grub-theme = final.stdenv.mkDerivation rec {
    pname = "nixos-grub-theme";
    version = "3.1";

    src = pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      rev = "8211cd9e987aa27fee701d73eccd843f242b56fa";
      sha256 = "iRlHr35MB3gWJNDkmnviczxY+1SGXSyRX3Ue1mUlSmc=";
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
  };
}
