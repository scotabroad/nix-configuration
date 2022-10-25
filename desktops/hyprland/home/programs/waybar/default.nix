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
	  #"hyprland/window"
	];
        modules-center = [ "clock" ];
        modules-right = [ 
	  "tray" 
	  "cpu" 
	  "memory"
	  "temperature"
	  "pulseaudio"
	  "battery"
	  "custom/power"
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
	  on-click = "true";
	};

        "clock" = {
	  format = "{:%a %b %d %I:%M %p}";
          interval = 60;
	  max-length = 25;
	  on-click = "true";
        };

	"cpu" = {
	  format = " {}%";
	  on-click = "true";
	};

	"memory" = {
	  format = " {}%";
	  on-click = "true";
	};

	"temperature" = {
	  thermal-zone = 1;
	  critical-threshold = 60;
	  format = " {temperatureC}°C";
	  format-critical = " {temperatureC}°C";
	  on-click = "true";
	};

        "tray" = {
          icon-size = 24;
	  spacing = 10;
	  on-click = "true";
        };

	"wlr/workspaces" = {
	  disable-scroll = false;
	  on-click = "activate";
	  on-scroll-up = "hyprctl dispatch workspace e+1";
	  on-scroll-down = "hyprctl dispatch workspace e-1";
	};

	"custom/search" = {
	  tooltip = false;
	  format = "   Applications";
	  on-click = "true";
	  #on-click = "fuzzel -b 2e3440e6 -t d8dee9ff -B 2 -r 5 -C 8fbcbbff -s 8fbcbbff -S 2e3440ff -i Nordzy-dark -f UbuntuMono:size=14";
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
	  on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
	};

	"custom/power" = {
	  format = "  ";
	  on-click = "true";
	};
      }
    ];
  };
}
