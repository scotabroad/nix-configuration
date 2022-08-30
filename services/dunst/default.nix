{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    enable = true;
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
	  background = "#2e3440";
	  foreground = "#eceff4";
	  timeout = 8;
	};

	urgency_normal = {
	  background = "#2e3440";
	  foreground = "#eceff4";
	  timeout = 10;
	};

	urgency_critical = {
	  background = "#1d2128";
	  foreground = "#bf616a";
	  timeout = 16;
	};
    };
  };
}
