{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
	background = "#fffaf3";
	foreground = "#797593";
      };

      urgency_normal = {
	background = "#fffaf3";
	foreground = "#575279";
      };

      urgency_critical = {
	background = "#faf4ed";
	foreground = "#b4637a";
      };
    };
  };
}
