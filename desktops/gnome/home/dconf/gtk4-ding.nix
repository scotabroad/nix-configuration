{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "gtk4-ding@smedius.gitlab.com"
      ];
    };
    "org/gnome/shell/extensions/gtk4-ding" = {
      add-volumes-opposite = true;
      dark-text-in-labels = false;
      icon-size = "standard";
      show-drop-place = true;
      show-home = true;
      show-link-emblem = true;
      show-network-volumes = false;
      show-second-monitor = false; #not in DING
      show-trash = false;
      show-volumes = false;
      sort-special-folders = false;
      start-corner = "top-left"; #Default is "bottom-right"
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    desktop-icons-ng-ding
    gtk4-desktop-icons-ng-ding
    user-themes
  ];
}
