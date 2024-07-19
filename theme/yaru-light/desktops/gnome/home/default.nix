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
  myButtons = windows;
in {
  imports = [
    ../../../../../desktops/gnome/home
    ../../../base/home
    ./dash-to-dock.nix
  ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Yaru";
    "org/gnome/desktop/background" = {
      picture-uri = "${pkgs.custom-wallpapers}/warty-final-ubuntu.png";
      picture-uri-dark = "${pkgs.custom-wallpapers}/ubuntu-wallpaper-d.png";
    };
    "org/gnome/desktop/interface" = {
      document-font-name = "Ubuntu 11";
      #font-name = "Ubuntu 11";
      monospace-font-name = "Ubuntu Mono 10";
    };
    "org/gnome/desktop/sound" = {
      theme-name = "Yaru";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = myButtons;
      titlebar-uses-system-font = true;
      titlebar-font = "Ubuntu Bold 11";
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
      #kitty's Ubuntu theme are in the comments to the right
      colors = {
        backgroundColor = "rgb(48,10,36)"; #300a24/rgb(48,10,36)
        boldColor = null; #same as foreground
        cursor = { 
          background = "rgb(255,255,255)"; #bbbbbb/rgb(187,187,187)
          foreground = "rgb(48,10,36)";
        };
        foregroundColor = "rgb(255,255,255)"; #eeeeec/rgb(238,238,236)
        highlight = {
          background = "rgb(255,255,255)"; #b4d5ff/rgb(180,213,255)
          foreground = "rgb(48,10,36)"; #300a24/rgb(48,10,36)
        };
        palette = [
          "rgb(23,20,33)" #2e3436/rgb(46,52,54)
          "rgb(192,28,40)" #cc0000/rgb(204,0,0)
          "rgb(38,162,105)" #4e9a06/rgb(78,154,6)
          "rgb(162,115,76)" #c4a000/rgb(196,160,0)
          "rgb(18,72,139)" #3465a4/rgb(52,101,164)
          "rgb(163,71,186)" #75507b/rgb(117,80,123)
          "rgb(42,161,179)" #06989a/rgb(6,152,154)
          "rgb(208,207,204)" #d3d7cf/rgb(211,215,207)
          "rgb(94,92,100)" #555753/rgb(85,87,83)
          "rgb(246,97,81)" #ef2929/rgb(239,41,41)
          "rgb(51,209,122)" #8ae234/rgb(138,226,52)
          "rgb(233,173,12)" #fce94f/rgb(252,233,79)
          "rgb(42,123,222)" #729fcf/rgb(114,159,207)
          "rgb(192,97,203)" #ad7fa8/rgb(173,127,168)
          "rgb(51,199,222)" #34e2e2/rgb(52,226,226)
          "rgb(255,255,255)" #eeeeec/rgb(238,238,236)
        ];
      };
      font = "UbuntuMono Nerd Font Mono 12";
      transparencyPercent = 10;
    };
  };
}
