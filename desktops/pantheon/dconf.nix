{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {

  imports = [
    ./dconf/desktop.nix
    ./dconf/dock.nix
    ./dconf/terminal.nix
    ./dconf/wingpanel.nix
  ];

  dconf.settings = {
    "io/elementary/calculator/saved-state" = {
      extended-shown = false; # keep false, don't need anything fancy
    };

    "io/elementary/calendar/saved-state" = {
      show-weeks = true;
      window-maximized = false;
      window-position = (mkTuple [82 46]);
      window-size = (mkTuple [1024 750]);
    };

    "io/elementary/camera/settings" = {
      window-maximized = false;
      window-size = (mkTuple [918 722]);
    };

    "io/elementary/code/saved-state" = {
      hp1-size = 232;
      vp-size = 125;
      window-position = (mkTuple [139 116]);
      window-size = (mkTuple [850 550]);
      window-state = "Normal";
    };

    "io/elementary/files/file-chooser" = {
      window-size = (mkTuple [850 450]);
    };

    "io/elementary/files/preferences" = {
      active-tab-position = 0;
      default-viewmode = "icon";
      sidebar-width = 191;
      window-position = (mkTuple [64 51]);
      window-size = (mkTuple [1000 680]);
      window-state = "normal";
    };

    "io/elementary/music" = {
      window-maximized = false;
    };

    "io/elementary/photos/preferences/ui" = {
      display-metadata = true;
      display-sidebar = true;
      events-sort-ascending = false;
      metadata-sidebar-position = 624;
      photo-thumbnail-scale = 256;
    };

    "io/elementary/photos/preferences/window" = {
      direct-height = 680;
      direct-maximize = false;
      direct-width = 1000;
      library-height = 680;
      library-maximize = false;
      library-width = 1000;
    };

    "io/elementary/switchboard/saved-state" = {
      window-maximized = false;
      window-position = (mkTuple [82 61]);
      window-size = (mkTuple [1024 720]);
    };

    "io/elementary/tasks" = {
      selected-list = "system-task-list";
      window-maximized = false;
      window-position = (mkTuple [94 30]);
      window-size = (mkTuple [1000 782]);
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-position = (mkTuple [0 0]);
      window-size = (mkTuple [1024 722]);
    };

    "org/gnome/evince/default" = {
      window-ratio = (mkTuple [0.75757575757575757 0.98039215686274506]);
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/gedit/plugins" = {
      active-plugins = ["spell" "sort" "openlinks" "modelines" "filebrowser" "docinfo"];
    };

    "org/gnome/gedit/plugins/filebrowser" = {
      root="file:///";
      tree-view = true;
    };

    "org/gnome/gedit/preferences/editor" = {
      highlight-current-line = false; # KEEP THIS FALSE!!! I HATE THIS FEATURE
      scheme = "nord-gedit"; # file is an xml file in ~/.local/share/gedit/styles
      wrap-last-split-mode = "word";
    };

    "org/gnome/gedit/preferences/ui" = {
      show-tabs-mode = "auto";
    };

    "org/gnome/gedit/state/window" = {
      bottom-panel-size = 10;
      side-panel-active-page = "GeditWindowDocumentsPanel";
      side-panel-size = 200;
      size = (mkTuple [390 678]);
      state = 87168; # should I actually keep track of this?
    };

    "org/gnome/nm-applet" = {
      disable-connected-notifications = true;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Primary><Alt>t";
      command = "io.elementary.terminal";
      name = "io.elementary.terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Alt>f";
      command = "firefox";
      name = "firefox";
    };

    "org/gtk/settings/color-chooser" = {
      custom-colors = [
        (mkTuple [0.23137254901960785 0.25882352941176473 0.32156862745098042 0.92953020134228193])
	(mkTuple [0.23137254901960785 0.25882352941176473 0.32156862745098042 0.86241610738255037])
	(mkTuple [0.23137254901960785 0.25882352941176473 0.32156862745098042 0.78523489932885904])
	(mkTuple [0.23137254901960785 0.25882352941176473 0.32156862745098042 1.0])
	(mkTuple [0.50588235294117645 0.63137254901960782 0.75686274509803919 1.0])
	(mkTuple [0.51372549019607838 0.58039215686274515 0.58823529411764708 1.0])
	(mkTuple [0.84705882352941175 0.87058823529411766 0.9137254901960784 1.0]) 
	(mkTuple [0.57647058823529407 0.63137254901960782 0.63137254901960782 1.0])
      ];
      selected-color = (mkTuple [true 0.23137254901960785 0.25882352941176473 0.32156862745098042 1.0]);
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 185;
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "descending";
      type-format = "category";
      window-position = (mkTuple [7 146]);
      window-size = (mkTuple [1113 459]);
    };
  };
}
