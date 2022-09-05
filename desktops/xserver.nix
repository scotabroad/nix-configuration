{ config, inputs, pkgs, ... }:

{
  imports = [
    ./pantheon/pantheon.nix
  ];

  services = {
    xserver = {
      enable = true;
      # Uncomment below to desable X server on boot
      # autorun = false; # Must run systemctl start display display-manager.service
      # Video Drivers can be specified here
      # videoDrivers = [ "r128" ]; this is for xf86-video-r128, might need this for xorg-x11-dev-intel
      displayManager = {
        lightdm = {
	  background = ../wallpaper/Nordic.jpg;
	  extraSeatDefaults = ''
            greeter-wrapper = ${pkgs.lightdm-dpi-fix}
          '';
	};
      };

      # Configure keymap in X11
      layout = "us";
    };
  };
}
