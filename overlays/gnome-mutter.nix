{ pkgs, ... }:

final: prev: {
  gnome = prev.gnome.overrideScope (gfinal: gprev: {
    mutter = gprev.mutter.overrideAttrs (oldAttrs: {
      src = pkgs.fetchgit {
        url = "https://gitlab.gnome.org/vanvugt/mutter.git";
        # GNOME 45: triple-buffering-v4-45
        rev = "663f19bc02c1b4e3d1a67b4ad72d644f9b9d6970";
        sha256 = "sha256-I1s4yz5JEWJY65g+dgprchwZuPGP9djgYXrMMxDQGrs=";
      };
    });
  });
}
