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
    ./extensions.nix
    ./ibus.nix
    ./keybindings.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      enable-hot-corners = false;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = myButtons;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    
    "org/gnome/settings-daemon/plugins/xsettings" = {
      overrides = [
    #    (mkDictionaryEntry ["Gtk/DialogsUseHeader" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/ShellShowsAppMenu" (mkVariant 0)])
    #    (mkDictionaryEntry ["Gtk/EnablePrimaryPaste" (mkVariant 0)])
        (mkDictionaryEntry ["Gtk/DecorationLayout" (mkVariant myButtons)])
      ];
    };
    
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

  };
}
