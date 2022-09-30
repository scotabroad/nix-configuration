{ lib, pkgs, ... }:

final: prev: {
  rose-pine-gtk-theme = final.stdenv.mkDerivation rec {
    pname = "rose-pine-gtk-theme";
    version = "unstable-2022-09-01";

    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "gtk";
      rev = "7a4c40989fd42fd8d4a797f460c79fc4a085c304";
      sha256 = "x8SH/d1/mslB2b8fcWrlVu0VDtBYjwjOqd5Lnb3k5GA=";
    };

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/themes/rose-pine-dawn-gtk/gtk-4.0
      mkdir -p $out/share/themes/rose-pine-gtk/gtk-4.0
      mkdir -p $out/share/themes/rose-pine-moon-gtk/gtk-4.0
      cd $src/gtk3
      cp -r * $out/share/themes
      cd $out/share/themes/rose-pine-dawn-gtk
      cp $src/gtk4/rose-pine-dawn.css $out/share/themes/rose-pine-dawn-gtk/gtk-4.0/gtk.css
      cd $out/share/themes/rose-pine-gtk
      cp $src/gtk4/rose-pine.css $out/share/themes/rose-pine-gtk/gtk-4.0/gtk.css
      cd $out/share/themes/rose-pine-moon-gtk
      cp $src/gtk4/rose-pine-moon.css $out/share/themes/rose-pine-moon-gtk/gtk-4.0/gtk.css
    '';

    meta = with lib; {
      description = "Rosé Pine theme for GTK";
      homepage = "https://github.com/rose-pine/gtk";
      platforms = platforms.linux;
      maintainers = [ maintainers.scotabroad ];
    };
  };
}
  
