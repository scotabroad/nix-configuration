{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      (prev.fetchpatch {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
        hash = "sha256-ATzWsX8M9z/OZkgwpoQZT6RIj5innOgatJnTd28I8rw=";
      })
    ];
  });
}
