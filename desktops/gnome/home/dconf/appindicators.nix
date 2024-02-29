{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };
    "org/gnome/shell/extensions/appindicator" = {
      custom-icons = [];
      icon-brightness = 0;
      icon-contrast = 0;
      icon-opacity = 240;
      icon-saturation = 0;
      icon-size = 0;
      icon-spacing = 12;
      tray-order = 1;
      tray-pos = "right";
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
  ];
}
