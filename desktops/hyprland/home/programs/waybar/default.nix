{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage waybar, might replace with eww
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
	height = 26;
        
	modules-left = [ "wlr/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ 
	  "tray" 
	  "cpu" 
	  "memory" 
	  #"temperature" 
	  "battery" 
	];

        "clock" = {
          interval = 60;
	  format = "{:%a %b %d %I:%M %p}";
	  max-length = 25;
        };

        "tray" = {
          icon-size = 24;
	  spacing = 10;
        };

	"tempurature" = {
	  thermal-zone = 3;
	};

	"wlr/workspaces" = {
	  disable-scroll = false;
	  on-click = "activate";
	};
      }
    ];
  };
}
