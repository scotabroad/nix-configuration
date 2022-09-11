{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "com/github/stsdc/monitor/settings" = {
      background-state = false;
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
      do-not-disturb = true;
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      document-font-name = "Ubuntu 10";
      font-name = "Ubuntu Regular 11";
      gtk-im-bus = "ibus";
      gtk-theme = "Nordic";
      icon-theme = "Nordzy-dark";
      monospace-font-name = "UbuntuMono Nerd Font Mono 12";
    };
  };
}
