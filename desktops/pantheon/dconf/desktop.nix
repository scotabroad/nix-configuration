{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkDictionaryEntry = lib.hm.gvariant.mkDictionaryEntry;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkVariant = lib.hm.gvariant.mkVariant;
  # Button Layouts
  # leftside:rightside Options: close, minimize, maximize, and menu
  windows = ":minimize,maximize,close";
  elementary = "close:menu,maximize";
  ubuntu = "close,maximize,minimize:";
  macOS = "close,minimize,maximize:";
  gnome = ":close";
  myButtons = elementary;
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
      button-layout = myButtons;
      titlebar-font = "Ubuntu 11";
    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      overrides = [
        (mkDictionaryEntry ["Gtk/DialogsUseHeader" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/ShellShowsAppMenu" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/EnablePrimaryPaste" (mkVariant 0)])
	(mkDictionaryEntry ["Gtk/DecorationLayout" (mkVariant myButtons)])
      ];
    };

    "org/pantheon/desktop/gala/appearance" = {
      button-layout = myButtons;
    };
  };
}
