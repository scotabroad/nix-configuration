{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkUint32 = lib.hm.gvariant.mkUint32;
  mkTuple = lib.hm.gvariant.mkTuple;

in {
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "${pkgs.gnome.gnome-terminal}/bin/gnome-terminal";
      name = "Terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
      logout = [ "<Control><Alt>Delete" "<Super>q" ];
      screensaver = [ "<Super>l" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ "<Alt>space" ];
      always-on-top = [ "<Super>p" ];
      close = [ "<Control>q" ];
      maximimze = [ "<Super>Up" ];
      minimize = [ "<Super>h" ];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-workspace-1 = [];
      move-to-workspace-down = [];
      move-to-workspace-last = [];
      move-to-workspace-left = [ "<Alt><Super>Left" ];
      move-to-workspace-right = [ "<Alt><Super>Right"];
      move-to-workspace-up = [];
      panel-run-dialog = [ "<Super>r"];
      switch-input-source = [ "<Control>space" ];
      switch-input-source-backward = [ "<Shift><Control>space" ];
      switch-to-workspace-1 = [];
      switch-to-workspace-down = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [ "<Shift><Super>Left" ];
      switch-to-workspace-right = [ "<Shift><Super>Right" ];
      switch-to-workspace-up = [];
      toggle-fullscreen = [ "<Super>f" ];
      unmaximize = [ "<Super>Down" "<Alt>F5"];
    };
    "org/gnome/shell/keybindings" = {
      screenshot = [ "Print" ];
      screenshot-window = [ "<Super>Print" ];
      show-screen-recording-ui = [ "<Super><Alt>Up" ];
      show-screenshot-ui = [ "<Alt>Print" ];
    };
  };
}
