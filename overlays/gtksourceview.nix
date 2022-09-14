{ pkgs, ... }:

final: prev: {
  gtksourceview4 = prev.gtksourceview4.overrideAttrs (attrs: {
      postInstall = (attrs.postInstall or "") + ''
        mkdir -p $out/share/gtksourceview-4/styles
	ln -s ${pkgs.nord-gedit}/share/gtksourceview-4/styles/* $out/share/gtksourceview-4/styles
      '';
    });
}
