{ pkgs, ... }:

final: prev: {
  # GNOME 46: triple-buffering-v4-46
  mutter = prev.mutter.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitLab {
      domain = "gitlab.gnome.org";
      owner = "vanvugt";
      repo = "mutter";
      rev = "triple-buffering-v4-46";
      sha256 = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
    };
  });
}
