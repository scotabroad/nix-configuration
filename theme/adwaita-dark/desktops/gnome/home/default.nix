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
    "org/gnome/desktop/background" = {
      picture-uri = "file://${pkgs.nixos-artwork.wallpapers.simple-blue}/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.simple-dark-gray}/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png";
    };
    "org/gnome/desktop/interface" = {
      document-font-name = "Cantarell 11";
      #font-name = "Cantarell 11";
      monospace-font-name = "Source Code Pro 10";
    };
    "org/gnome/desktop/sound" = {
      theme-name = "freedesktop";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = myButtons;
      titlebar-uses-system-font = true;
      titlebar-font = "Cantarell Bold 11";
    };
    "org/gnome/settings-daemon/plugins/xsettings" = {
      overrides = [
    #    (mkDictionaryEntry ["Gtk/DialogsUseHeader" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/ShellShowsAppMenu" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/EnablePrimaryPaste" (mkVariant 0)])
        (mkDictionaryEntry ["Gtk/DecorationLayout" (mkVariant myButtons)])
      ];
    };
    "org/gnome/terminal/legacy/profiles:/:6df3d4ab-f391-4e2f-9917-e8dd0cfa4763" = {
      use-theme-colors = true;
    };
  };

  programs.gnome-terminal.profile = {
    "6df3d4ab-f391-4e2f-9917-e8dd0cfa4763" = {
      colors = {
        backgroundColor = "rgb(23,20,33)"; 
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
          "rgb(23,20,33)"
          "rgb(192,28,40)"
          "rgb(38,162,105)"
          "rgb(162,115,76)"
          "rgb(18,72,139)"
          "rgb(163,71,186)"
          "rgb(42,161,179)"
          "rgb(208,207,204)"
          "rgb(94,92,100)"
          "rgb(246,97,81)"
          "rgb(51,209,122)"
          "rgb(233,173,12)"
          "rgb(42,123,222)"
          "rgb(192,97,203)"
          "rgb(51,199,222)"
          "rgb(255,255,255)"
        ];
      };
      font = "SauceCodePro Nerd Font Mono 10";
      transparencyPercent = 10;
    };
  };
}
