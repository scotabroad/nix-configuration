{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      (prev.fetchpatch {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
        hash = "sha256-MmiyYHxWM6uB9aA6R9ZMKcDfZe9y1z7o/7KXTzdZMY8=";
      })
    ];
  });
}
