{ pkgs, ... }:

{
  dconf.settings = {

    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        "AlphabeticalAppGrid@stuarthayhurst"
        "trayIconsReloaded@selfmade.pl"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    tray-icons-reloaded
    user-themes
  ];
}
