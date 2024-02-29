{ pkgs, ... }:

{
  imports = [
    ./appindicators.nix
    #./ding.nix #currently broken? Version 67
    #./gtk4-ding.nix #uses libadwaita, but does not use theme Version 71
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        "AlphabeticalAppGrid@stuarthayhurst"
        #"color-picker@tuberry"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    #Settings DING and GTK4-DING share with Nautilus
    "org/gnome/nautilus/preferences" = {
      click-policy = "double";
      open-folder-on-dnd-hover = true; #Only in GTK4-DING
      show-hidden-files = false;
      show-delete-permanently = false;
      show-image-thumbnails = "local-only";
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    color-picker
    user-themes
  ];
}
