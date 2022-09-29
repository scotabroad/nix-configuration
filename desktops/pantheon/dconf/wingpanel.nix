{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "com/github/stsdc/monitor/settings" = {
      background-state = true;
      indicator-state = true;
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
      clock-format = "12h";
      clock-show-seconds = false;
      clock-show-weekday = true;
    };

    "io/elementary/desktop/wingpanel/power" = {
      show-percentage = true;
    };

    "io/elementary/desktop/wingpanel/sound" = {
      last-title-info = ["io.elementary.music.desktop" "" ""];
    };

    "io/elementary/notifications" = {
      do-not-disturb = false;
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      gtk-im-bus = "ibus";
    };
  };
}
