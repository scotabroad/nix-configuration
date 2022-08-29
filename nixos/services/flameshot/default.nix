{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage Flameshot
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;
    settings = {
      General = {
        disabledTrayIcon = true;
	showStartupLaunchMessage = false;
      };
    };
  };
}
