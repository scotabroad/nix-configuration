{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "io/elementary/calculator/saved-state" = {
      extended-shown = false; # keep false, don't need anything fancy
    };

    "io/elementary/calendar/saved-state" = {
      show-weeks = true;
      window-maximized = false;
      window-position = lib.hm.gvariant.mkTuple [82 46];
      window-size = lib.hm.gvariant.mkTuple [1024 750];
    };

    "io/elementary/camera/settings" = {
      window-maximized = false;
      window-size = lib.hm.gvariant.mkTuple [918 722];
    };

    "io/elementary/code/saved-state" = {
      hp1-size = 232;
      vp-size = 125;
      window-position = lib.hm.gvariant.mkTuple [139 116];
      window-size = lib.hm.gvariant.mkTuple [850 550];
      window-state = "Normal";
    };

    "io/elementary/desktop/wingpanel" = {
      use-transparency = true;
    };

    "io/elementary/desktop/wingpanel/applications-menu" = {
      use-category = false;
    };

    "io/elementary/desktop/wingpanel/bluetooth" = {
      bluetooth-enabled = false;
    };

    "io/elementary/desktop/wingpanel/datetime" = {
      clock-format = 12;
      clock-show-seconds = false;
      clock-show-weekday = true;
    };

    "io/elementary/desktop/wingpanel/power" = {
      show-percentage = false;
    };

    "io/elementary/desktop/sound" = {
      last-title-info = ["io.elementary.music.desktop" "" ""];
    };
      
    "io/elementary/files/file-chooser" = {
      window-size = lib.hm.gvariant.mkTuple [850 450];
    };

    "io/elementary/files/preferences" = {
      active-tab-position = 0;
      default-viewmode = "icon";
      sidebar-width = 191;
      window-position = lib.hm.gvariant.mkTuple [64 51];
      window-size = lib.hm.gvariant.mkTuple [1000 680];
      window-state = "normal";
    };

    "io/elementary/music" = {
      window-maximized = false;
    };

    "io/elementary/notifications" = {
      do-not-disturb = true;
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
      window-position = lib.hm.gvariant.mkTuple [82 61];
      window-size = lib.hm.gvariant.mkTuple [1024 720];
    };

    "io/elementary/tasks" = {
      selected-list = "system-task-list";
      window-maximized = false;
      window-position = lib.hm.gvariant.mkTuple [94 30];
      window-size = lib.hm.gvariant.mkTuple [1000 782];
    };

    "io/elementary/terminal/saved-state" = {
      focused-tab = 0;
      tabs = [];
      tab-zooms = ["1"];
      window-position = lib.hm.gvariant.mkTuple [188 109];
      window-size = lib.hm.gvariant.mkTuple [752 564];
      window-state = "Normal";
    };

    "io/elementary/terminal/settings" = {
      background = "rgb(59,66,82)";
      cursor-color = "rgb(129,161,193)";
      follow-system-style = false; # shouldn't this be true?
      foreground = "rgb(216,222,233)";
      palette = "rgb(59,66,82):rgb(191,97,106):rgb(163,190,140):rgb(235,203,139):rgb(129,161,193):rgb(180,142,173):rgb(136,192,208):rgb(229,233,240):rgb(76,86,106):rgb(191,97,106):rgb(163,190,140):rgb(235,203,139):rgb(129,161,193):rgb(180,142,173):rgb(143,188,187):rgb(236,239,244)";
      prefer-dark-style = true;
      theme = "custom";
    };
    
    "org/pantheon/desktop/gala/appearance" = {
      button-layout = "close:maximize";
    };
  };
}
