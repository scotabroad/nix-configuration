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
	  on-click = "fuzzel -b 282a36e6 -t f8f8f2ff -B 2 -r 5 -C 6272a4ff -s 44475aff -S f8f8f2ff -i Zafiro-icons-Dark -f UbuntuMono:size=14";
	};
      }
    ];
  };
}
