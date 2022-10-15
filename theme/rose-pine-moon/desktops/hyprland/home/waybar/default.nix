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
        
	modules-left = [ 
	  "custom/search"
	  "wlr/workspaces"
	  "hyprland/window"
	];
        modules-center = [ "clock" ];
        modules-right = [ 
	  "tray" 
	  "cpu" 
	  "memory" 
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

	"wlr/workspaces" = {
	  disable-scroll = false;
	  on-click = "activate";
	};

	"custom/search" = {
	  format = "  Applications";
	  on-click = "fuzzel -b 232136e6 -t e0def4ff -B 2 -r 5 -C c4a7e7ff -s c4a7e7ff -S 232136ff -i rose-pine-moon-icons -f UbuntuMono:size=14";
	};
      }
    ];
  };
}
