{ lib, pkgs, ... }:

final: prev: {
  dracula-gedit = final.stdenv.mkDerivation rec {
    pname = "dracula-gedit";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "gedit";
      rev = "ed2f4cf0eda35669e8c676e1b1e0aaaef53d3eea";
      sha256 = "s27tJgxx05qf5TTG6sYVrnDEoXw1bW/bm6/rLh/8y0s=";
    };

    #Install to PATH/share/gtksourceview-4/styles
    installPhase = ''
      mkdir -p $out/share/gtksourceview-4/styles
      cp $src/dracula.xml $out/share/gtksourceview-4/styles/dracula.xml
    '';

    meta = with lib; {
      homepage = "https://github.com/dracula/gedit";
      license = licenses.mit;
      platforms = platforms.linux;
      maintainers = [ maintainers.scotabroad ];
    };
  };
  
  gtksourceview4 = prev.gtksourceview4.overrideAttrs (attrs: {
    postInstall = (attrs.postInstall or "") + ''
      mkdir -p $out/share/gtksourceview-4/styles
      ln -s ${pkgs.dracula-gedit}/share/gtksourceview-4/styles/* $out/share/gtksourceview-4/styles
    '';
  });
}
