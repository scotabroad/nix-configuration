{ pkgs, ... }:

final: prev: {
  # GNOME 47: triple-buffering-v4-47
  mutter = prev.mutter.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitLab {
      domain = "gitlab.gnome.org";
      owner = "vanvugt";
      repo = "mutter";
      rev = "triple-buffering-v4-47";
      sha256 = "sha256-1VXEzKwzrqLCZby2oWxjclA08kPhxs/Om5N17qYeglM=";
    };
  });
}
