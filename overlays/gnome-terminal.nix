{ pkgs, ... }:

final: prev: {
  gnome-terminal = prev.gnome-terminal.overrideAttrs (oldAttrs: {
    patches = [
      "${prev.fetchgit {
        url = "https://aur.archlinux.org/gnome-terminal-transparency.git";
        rev = "522f8e2c8265905b696a6f2ccad71763f394f3dd";
        hash = "sha256-asjoT5DagpaxQ1T8AOPmyGt+6kUbwt8ZrLxLDFr/qvk=";
        sparseCheckout = [
          "transparency.patch"
        ];
      }}/transparency.patch"
    ];
  });
}
