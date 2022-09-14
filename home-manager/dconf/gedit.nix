{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "org/gnome/gedit/plugins" = {
      active-plugins = ["spell" "sort" "openlinks" "modelines" "filebrowser" "docinfo"];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      root = "file:///";
      tree-view = true;
    };

    "org/gnome/gedit/preferences/editor" = {
      highlight-current-line = true;
      scheme = "nord-gedit"; # theme has been packaged
      wrap-last-split-mode = "word";
    };

    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "word";
    };

    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 10;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = mkTuple [390 678];
      state = 87168; # should I actually keep track of this?
    };
  };
}
