{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    enable = true;
    waylandDisplay = "wayland-0"; 
    settings = {
      global = {
        # Where notifications show on screen
        origin = "top-center";
	offset = "0x55";

	progress_bar = "true";
	transparency = 10;

	padding = 10;
	horizontal_padding = 10;

	# Disable frame
	frame_width = 0;

	font = "UbuntuMono Nerd Font Mono 10";
      };

	urgency_low = {
	  #background = "#2e3440";
	  #foreground = "#eceff4";
	  background = "#2a273f";
	  foreground = "#908caa";
	  timeout = 8;
	};

	urgency_normal = {
	  #background = "#2e3440";
	  #foreground = "#eceff4";
	  background = "#2a273f";
	  foreground = "#e0def4";
	  timeout = 10;
	};

	urgency_critical = {
	  #background = "#1d2128";
	  #foreground = "#bf616a";
	  background = "#232136";
	  foreground = "#eb6f92";
	  timeout = 16;
	};
    };
  };
}
