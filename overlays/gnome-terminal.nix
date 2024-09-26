{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      (prev.fetchpatch {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
        hash = "sha256-B+K6/1ULLTZuWqKBQSUacmezotIBSMl7ApuEV9+zpEA=";
      })
    ];
  });
}
