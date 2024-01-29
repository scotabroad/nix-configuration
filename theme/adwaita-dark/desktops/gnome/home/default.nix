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
  myButtons = gnome;
in {
  imports = [
    ../../../../../desktops/gnome/home
    ../../../base/home
  ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Default";
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
        backgroundColor = "rgb(29,29,29)"; 
        boldColor = null; #same as foreground
        cursor = {
          background = "rgb(222,221,218)";
          foreground = "rgb(29,29,29)";
        };
        foregroundColor = "rgb(222,221,218)";
        highlight = {
          background = "rgb(48,48,48)";
          foreground = "rgb(192,191,188)";
        };
        palette = [
          "rgb(29,29,29)"
          "rgb(237,51,59)"
          "rgb(87,227,137)"
          "rgb(255,120,0)"
          "rgb(98,160,234)"
          "rgb(145,65,172)"
          "rgb(91,200,175)"
          "rgb(222,221,218)"
          "rgb(154,153,150)"
          "rgb(246,97,81)"
          "rgb(143,240,164)"
          "rgb(255,163,72)"
          "rgb(153,193,241)"
          "rgb(220,138,221)"
          "rgb(147,221,194)"
          "rgb(246,245,244)"
        ];
      };
      #font = "SauceCodePro Nerd Font Mono 10";
      font = "UbuntuMono Nerd Font Mono 12";
      transparencyPercent = 10;
    };
  };
}
