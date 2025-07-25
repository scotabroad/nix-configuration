{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      (prev.fetchpatch {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/transparency.patch?h=gnome-terminal-transparency";
        hash = "sha256-vyVrjS6LC2DFMlk2WxFGDiTeh8KilHT9q7WUbbzb+H0=";
      })
    ];
  });
}
