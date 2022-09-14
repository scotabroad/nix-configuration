{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "net/launchpad/plank/docks/dock1" = {
      alignment = "center";
      auto-pinning = true;
      current-workspace-only = false;
      dock-items = [
        "gala-multitaskingview.dockitem"
        "io.elementary.files.dockitem"
	"firefox.dockitem"
	"vivaldi-stable.dockitem"
	"discord.dockitem"
	"element-desktop.dockitem"
	"steam.dockitem"
	"io.elementary.terminal.dockitem"
	"io.elementary.switchboard.dockitem"
	"trash.dockitem"
      ];
      hide-delay = 500;
      hide-mode = "window-dodge";
      icon-size = 48;
      items-alignment = "center";
      lock-items = false;
      monitor = "";
      offset = 0;
      pinned-only = false;
      position = "left";
      pressure-reveal = false;
      show-dock-item = false;
      theme = "Matte";
      tooltips-enabled = true;
      unhide-delay = 250;
      zoom-enabled = false;
      zoom-percent = 150;
    };
  };
}
