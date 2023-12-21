{ pkgs, ... }:

final: prev: {
  gnome = prev.gnome.overrideScope' (gfinal: gprev: {
    gnome-terminal = gprev.gnome-terminal.overrideAttrs (oldAttrs: {
      patches = [
        (prev.fetchpatch {
          url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
          hash = "sha256-HgkV4+K6lG+e9hXeIVpfdv+6jZ/qgpCv1iceicHCYqs=";
        })
      ];
    });
  });
}
