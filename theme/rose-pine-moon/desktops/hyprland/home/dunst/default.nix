{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    settings = {
      urgency_low = {
	background = "#2a273f";
	foreground = "#908caa";
      };

      urgency_normal = {
	background = "#2a273f";
	foreground = "#e0def4";
      };

      urgency_critical = {
	background = "#232136";
	foreground = "#eb6f92";
      };
    };
  };
}
