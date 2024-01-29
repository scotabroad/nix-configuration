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
    "org/gnome/shell/extensions/user-theme".name = "Dracula";
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
        backgroundColor = "rgb(40,42,54)"; 
        boldColor = null; #same as foreground
        cursor = {
          background = "rgb(248,248,242)";
          foreground = "rgb(40,42,54)";
        };
        foregroundColor = "rgb(248,248,242)";
        highlight = {
          background = "rgb(68,71,90)";
          foreground = "rgb(255,255,255)";
        };
        palette = [
          "rgb(33,34,44)"
          "rgb(255,85,85)"
          "rgb(80,250,123)"
          "rgb(241,250,140)"
          "rgb(189,147,249)"
          "rgb(255,121,198)"
          "rgb(139,233,253)"
          "rgb(248,248,242)"
          "rgb(98,114,164)"
          "rgb(255,110,110)"
          "rgb(105,255,148)"
          "rgb(255,255,165)"
          "rgb(214,172,255)"
          "rgb(255,146,223)"
          "rgb(164,255,255)"
          "rgb(255,255,255)"
        ];
      };
      font = "UbuntuMono Nerd Font Mono 12";
      transparencyPercent = 10;
    };
  };
}
