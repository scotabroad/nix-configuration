{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage waybar, might replace with eww
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        mainBar = {
          layer = "top";
	  position = "top";
	  height = 30; #play around with this
        };
        modules-left = [ "hyprland/window" "wlr/workspaces" "wlr/taskbar" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "cpu" "memory" "temperature" "battery" ];

        "clock" = {
          interval = 60;
	  format = "{:%a %b %d %I:%M %p}";
	  max-length = 25;
        };

        "hyprland/window" = {
          format = "{}";
        };

        "tray" = {
          icon-size = 24;
	  spacing = 10;
        };

	"tempurature" = {
	  thermal-zone = 3;
	};
      }
    ];
  };
}
