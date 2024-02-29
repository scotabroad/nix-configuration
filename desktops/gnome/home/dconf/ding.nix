{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "ding@rastersoft.com"
      ];
    };
    "org/gnome/shell/extensions/ding" = {
      add-volumes-opposite = true;
      arrangeorder = "DESCENDINGNAME";
      dark-text-in-labels = false;
      icon-size = "standard";
      keep-arranged = false;
      keep-stacked = false;
      show-drop-place = true;
      show-home = true;
      show-link-emblem = true;
      show-network-volumes = false;
      show-trash = false;
      show-volumes = false;
      sort-special-folders = false;
      start-corner = "top-left"; #Default is "bottom-right"
      unstackedtypes = [];
      use-nemo = false;
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    desktop-icons-ng-ding
  ];
}
