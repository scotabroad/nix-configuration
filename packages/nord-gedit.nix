{ lib, pkgs, ... }:

final: prev: {
  nord-gedit = final.stdenv.mkDerivation rec {
    pname = "nord-gedit";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "arcticicestudio";
      repo = "nord-gedit";
      rev = "acadf99a71ca3cdf0d653c5daa8afc62b9f71aec";
      hash = "sha256-dml2mEDm4Sk87IUCS0T1GMG9L7Je/53rFKIuJL9JSpE=";
    };

    #Install to PATH/share/gtksourceview-4/styles
    installPhase = ''
      mkdir -p $out/share/gtksourceview-4/styles
      cp $src/src/xml/nord.xml $out/share/gtksourceview-4/styles/nord.xml
    '';

    meta = with lib; {
      homepage = "https://github.com/arcticicestudio/nord-gedit";
      license = licenses.mit;
      platforms = platforms.linux;
      maintainers = [ maintainers.scotabroad ];
    };
  };
  
  gtksourceview4 = prev.gtksourceview4.overrideAttrs (attrs: {
    postInstall = (attrs.postInstall or "") + ''
      mkdir -p $out/share/gtksourceview-4/styles
      ln -s ${pkgs.nord-gedit}/share/gtksourceview-4/styles/* $out/share/gtksourceview-4/styles
    '';
  });
}
