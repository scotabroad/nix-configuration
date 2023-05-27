{ lib, pkgs, ... }:

final: prev: {
  everforest-gedit = final.stdenv.mkDerivation rec {
    pname = "everforest-gedit";
    version = "unstable-2023-03-20";

    src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Everforest-GTK-Theme";
      rev = "8481714cf9ed5148694f1916ceba8fe21e14937b";
      sha256 = "NO12ku8wnW/qMHKxi5TL/dqBxH0+cZbe+fU0iicb9JU=";
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/gtksourceview-4/styles
      cp -r extra/text-editor/*.xml $out/share/gtksourceview-4/styles
    '';

    meta = with lib; {
      description = "Everforest GTK Theme";
      homepage = "https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme";
      platforms = platforms.linux;
      maintainers = [ maintainers.scotabroad ];
    };
  };

  gtksourceview4 = prev.gtksourceview4.overrideAttrs (attrs: {
    postInstall = (attrs.postInstall or "") + ''
      mkdir -p $out/share/gtksourceview-4/styles
      ln -s ${pkgs.everforest-gedit}/share/gtksourceview-4/styles/* $out/share/gtksourceview-4/styles
      '';
  });
} 
