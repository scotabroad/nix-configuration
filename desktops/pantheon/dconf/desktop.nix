{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkDictionaryEntry = lib.hm.gvariant.mkDictionaryEntry;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkVariant = lib.hm.gvariant.mkVariant;
in {
  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      primary-color = "rgb(46,52,64)";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = true; #if doubting whether dconf was updated, just flip this to false :)
    };

    "org/gnome/desktop/sound" = {
      theme-name = "elementary";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "close,maximize:minimize";
      titlebar-font = "Ubuntu 11";
    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      overrides = [
        (mkDictionaryEntry ["Gtk/DialogsUseHeader" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/ShellShowsAppMenu" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/EnablePrimaryPaste" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/DecorationLayout" (mkVariant "close,maximize:minimize")])
      ];
    };

    "org/pantheon/desktop/gala/appearance" = {
                      #leftside:rightside Options: close, minimize, maximize, menu
      button-layout = "close,maximize:minimize"; # also need to modify org/gnome/desktop/wm/preferences/button-layout and
    };                                           # org/gnome/settings-daemon/plugins/xsettings
  };
}
