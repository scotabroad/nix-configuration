{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      activate-single-window = true;
      animate-show-apps = true;
      animation-time = 0.2;
      #Keybindings to launch nth dash app
      app-ctrl-hotkey-1 = ["<Ctrl><Super>1"];
      app-ctrl-hotkey-10 = ["<Ctrl><Super>0"];
      app-ctrl-hotkey-2 = ["<Ctrl><Super>2"];
      app-ctrl-hotkey-3 = ["<Ctrl><Super>3"];
      app-ctrl-hotkey-4 = ["<Ctrl><Super>4"];
      app-ctrl-hotkey-5 = ["<Ctrl><Super>5"];
      app-ctrl-hotkey-6 = ["<Ctrl><Super>6"];
      app-ctrl-hotkey-7 = ["<Ctrl><Super>7"];
      app-ctrl-hotkey-8 = ["<Ctrl><Super>8"];
      app-ctrl-hotkey-9 = ["<Ctrl><Super>9"];
      #Keybindings to trigger nth dash app
      app-hotkey-1 = ["<Super>1"];
      app-hotkey-10 = ["<Super>0"];
      app-hotkey-2 = ["<Super>2"];
      app-hotkey-3 = ["<Super>3"];
      app-hotkey-4 = ["<Super>4"];
      app-hotkey-5 = ["<Super>5"];
      app-hotkey-6 = ["<Super>6"];
      app-hotkey-7 = ["<Super>7"];
      app-hotkey-8 = ["<Super>8"];
      app-hotkey-9 = ["<Super>9"];
      #Keybindings to tigger nth dash app with shift behavior
      app-shift-hotkey-1 = ["<Shift><Super>1"];
      app-shift-hotkey-10 = ["<Shift><Super>0"];
      app-shift-hotkey-2 = ["<Shift><Super>2"];
      app-shift-hotkey-3 = ["<Shift><Super>3"];
      app-shift-hotkey-4 = ["<Shift><Super>4"];
      app-shift-hotkey-5 = ["<Shift><Super>5"];
      app-shift-hotkey-6 = ["<Shift><Super>6"];
      app-shift-hotkey-7 = ["<Shift><Super>7"];
      app-shift-hotkey-8 = ["<Shift><Super>8"];
      app-shift-hotkey-9 = ["<Shift><Super>9"];
      apply-custom-theme = false;
      apply-glossy-effect = true;
      autohide = true;
      autohide-in-fullscreen = false;
      background-color = "#ffffff";
      background-opacity = 0.8;
      bolt-support = true;
      click-action = "focus-or-previews";
      custom-background-color = false;
      customize-alphas = false;
      custom-theme-customize-running-dots = false;
      custom-theme-running-dots-border-color = "#ffffff";
      custom-theme-running-dots-border-width = 0;
      custom-theme-running-dots-color = "#ffffff";
      custom-theme-shrink = true; #Ubuntu also marked as TODO
      dash-max-icon-size = 48;
      disable-overview-on-startup = true;
      dock-fixed = true; #needs to be false to allow for intellihide, but this is not enabled by default on Ubuntu
      dock-position = "LEFT";
      extend-height = true;
      force-straight-corner = false;
      height-fraction = 0.9;
      hide-delay = 0.2;
      hot-keys = true;
      hotkeys-overlays = true;
      hotkeys-show-dock = true;
      icon-size-fixed = true;
      intellihide = true;
      intellihide-mode = "ALL_WINDOWS";
      isolate_locations = true;
      isolate_monitors = false;
      isolate_workspaces = false;
      max-alpha = 0.8;
      middle-click-action = "launch";
      min-alpha = 0.2;
      minimize-shift = true;
      multimonitor = false;
      pressure-threshold = 100;
      preview-size-scale = 0;
      require-pressure-to-show = true;
      running-indicator-dominant-color = false;
      running-indicator-style = "DOTS";
      scroll-action = "switch-workspace";
      scroll-switch-workspace = true;
      scroll-to-focused-application = true;
      shift-click-action = "launch";
      shift-middle-click-action = "minimize";
      shortcut = ["<Super>q"]; #what does this do?
      shortcut-text = "<Super>q";
      shortcut-timeout = 2;
      show-apps-at-top = false;
      show-delay = 0.25;
      show-favorites = true;
      show-mounts = true;
      show-mounts-network = true;
      show-mounts-only-mounted = false;
      show-running = true;
      show-show-apps-button = true;
      show-trash = true;
      show-windows-preview = true;
      transparency-mode = "DEFAULT";
      unity-backlit-items = false;
      workspace-agnostic-urgent-windows = true;
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
  ];
}
