{ lib, pkgs, ... }:

final: prev: {
  framework-grub-theme = final.stdenv.mkDerivation rec {
    pname = "framework-grub-theme";
    version = "2.8";

    src = pkgs.fetchFromGitHub {
      owner = "AdisonCavani";
      repo = "distro-grub-themes";
      rev = "f57c4322aaf7ea265eb0032c89c5850a9ee65e64";
      sha256 = "fnw4FxkGnvi8OtpDafjuCb2NwcqPTy4GqijMKrT49oA=";
    };

    installPhase = ''
      mkdir -p $out
      cp $src/themes/framework.tar $out
      cd $out
      tar -xf framework.tar
      rm framework.tar
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
      maintainers = [ maintainers.adisoncavani ];
    };
  };
}
