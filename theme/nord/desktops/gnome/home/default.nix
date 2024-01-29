{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkDictionaryEntry = lib.hm.gvariant.mkDictionaryEntry;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkVariant = lib.hm.gvariant.mkVariant;
  # Button Layouts
  # leftside:rightside Options: close, minimize, maximize, and appmenu
  windows = ":minimize,maximize,close";
  elementary = "close:maximize";
  ubuntu = "close,maximize,minimize:";
  macOS = "close,minimize,maximize:";
  gnome = "appmenu:close";
  custom = "close,appmenu:maximize";
  myButtons = custom;
in {
  imports = [
    ../../../../../desktops/gnome/home
    ../../../base/home
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Nordic";
    "org/gnome/desktop/wm/preferences" = {
      button-layout = myButtons;
    };
    "org/gnome/settings-daemon/plugins/xsettings" = {
      overrides = [
    #    (mkDictionaryEntry ["Gtk/DialogsUseHeader" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/ShellShowsAppMenu" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/EnablePrimaryPaste" (mkVariant 0)])
        (mkDictionaryEntry ["Gtk/DecorationLayout" (mkVariant myButtons)])
      ];
    };
  };

  programs.gnome-terminal.profile = {
    "6df3d4ab-f391-4e2f-9917-e8dd0cfa4763" = {
      colors = {
        backgroundColor = "rgb(46,52,64)"; 
        boldColor = null; #same as foreground
        cursor = {
          background = "rgb(129,161,193)";
          foreground = "rgb(17,17,17)";
        };
        foregroundColor = "rgb(216,222,233)";
        highlight = {
          background = "rgb(255,250,205)";
          foreground = "rgb(0,0,0)";
        };
        palette = [
          "rgb(59,66,82)"
          "rgb(191,97,106)"
          "rgb(163,190,140)"
          "rgb(235,203,139)"
          "rgb(129,161,193)"
          "rgb(180,142,173)"
          "rgb(136,192,208)"
          "rgb(229,233,240)"
          "rgb(76,86,106)"
          "rgb(191,97,106)"
          "rgb(163,190,140)"
          "rgb(235,203,139)"
          "rgb(129,161,193)"
          "rgb(180,142,173)"
          "rgb(143,188,187)"
          "rgb(236,239,244)"
        ];
      };
      font = "UbuntuMono Nerd Font Mono 12";
      transparencyPercent = 10;
    };
  };
}
