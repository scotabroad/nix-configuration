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
	timeout = 8;
      };

      urgency_normal = {
	timeout = 10;
      };

      urgency_critical = {
	timeout = 16;
      };
    };
  };
}
