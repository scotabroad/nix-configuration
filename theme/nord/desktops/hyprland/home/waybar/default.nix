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
	  on-click = "fuzzel -b 2e3440e6 -t d8dee9ff -B 2 -r 5 -C 8fbcbbff -s 8fbcbbff -S 2e3440ff -i Nordzy-dark -f UbuntuMono:size=14";
	};
      }
    ];
  };
}
