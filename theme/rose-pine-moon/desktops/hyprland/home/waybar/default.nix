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
	  "temperature"
	  "pulseaudio"
	  "battery" 
	];

	"battery" = {
	  states = {
	    full = 100;
	    nines = 99;
	    eights = 89;
	    sevens = 79;
            sixes = 69;
	    fives = 59;
	    fours = 49;
	    threes = 39;
	    twos = 29;
	    ones = 19;
	  };
	  format-ones = " {capacity}%";
	  format-twos = " {capacity}%";
	  format-threes = " {capacity}%";
	  format-fours = " {capacity}%";
	  format-fives = " {capacity}%";
	  format-sixes = " {capacity}%";
	  format-sevens = " {capacity}%";
	  format-eights = " {capacity}%"; 
	  format-nines = " {capacity}%"; 
	  format-full = " {capacity}%";
	};

        "clock" = {
	  format = "{:%a %b %d %I:%M %p}";
          interval = 60;
	  max-length = 25;
        };

	"cpu" = {
	  format = " {}%";
	};

	"memory" = {
	  format = " {}%";
	};

	"temperature" = {
	  thermal-zone = 1;
	  critical-threshold = 60;
	  format = " {temperatureC}°C";
	  format-critical = " {temperatureC}°C";
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
	  tooltip = false;
	  format = "   Applications";
	  on-click = "fuzzel -b 232136e6 -t e0def4ff -B 2 -r 5 -C c4a7e7ff -s c4a7e7ff -S 232136ff -i rose-pine-moon-icons -f UbuntuMono:size=14";
	};

	"pulseaudio" = {
	  format = "{icon} {volume}%";
	  format-bluetooth = "{icon} {volume}%";
	  format-muted = "婢 Muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" ""];
          };
          scroll-step = 1;
	};
      }
    ];
  };
}
