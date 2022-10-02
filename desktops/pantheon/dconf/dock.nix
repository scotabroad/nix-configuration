{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "net/launchpad/plank/docks/dock1" = {
      alignment = "center";
      auto-pinning = true;
      current-workspace-only = false;
      dock-items = [
        "io.elementary.files.dockitem"
	"firefox.dockitem"
	"vivaldi-stable.dockitem"
	"discord.dockitem"
	"element-desktop.dockitem"
	"steam.dockitem"
	"kitty.dockitem"
	"io.elementary.switchboard.dockitem"
      ];
      hide-delay = 500;
      hide-mode = "window-dodge";
      icon-size = 48;
      items-alignment = "center";
      lock-items = true;
      monitor = "";
      offset = 0;
      pinned-only = false;
      position = "bottom";
      pressure-reveal = false;
      show-dock-item = false;
      theme = "Gtk+";
      tooltips-enabled = true;
      unhide-delay = 250;
      zoom-enabled = false;
      zoom-percent = 150;
    };
  };
}
