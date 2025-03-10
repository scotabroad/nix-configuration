{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      (prev.fetchpatch {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
        hash = "sha256-SXTsw8HNBNKFfiAlEWKVd5A48mVL4JAudgE4ckCSzC8=";
      })
    ];
  });
}
