{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dunst
    ./network-manager-applet
    ./picom
    ./status-notifier-watcher
    ./taffybar
  ];

  systemd.user = {
    services = {
      # An attempt to get ibus working with taffybar
      ibus = {
        Unit = {
          Description = "ibus daemon";
          After = ["tray.target"];
        };
        Service = {
          ExecStart = "${pkgs.ibus}/bin/ibus-daemon -drxR";
        };
      };
    };
    targets = {
      #Necessary for taffybar
      tray = {
        Unit = {
          Description = "tray target";
          Requires = ["graphical-session-pre.target"];
        };
      };
    };
  };
}
