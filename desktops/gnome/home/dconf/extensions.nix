{ pkgs, ... }:

{
  dconf.settings = {

    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    tray-icons-reloaded
    user-themes
  ];
}
