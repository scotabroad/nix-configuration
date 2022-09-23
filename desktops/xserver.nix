{ config, inputs, pkgs, lib, ... }:

let
  # dpi adjustment calculations
  monitorHeight = 2256;
  monitorWidth = 1504;
  monitorHeightInches = 11.25; # 285 mm
  monitorWidthInches = 7.5; # 190.5 mm
  newDPI = builtins.ceil ((monitorHeight / monitorHeightInches) + (monitorWidth / monitorWidthInches)) / 2; # Looking at a DPI of 201
in {
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
      dpi = newDPI;
      displayManager = {
        lightdm = {
	  background = ../wallpaper/Nordic.jpg;
	  greeters.gtk = {
	    enable = true;
	    clock-format = "%l:%m %p";
	    cursorTheme = {
	      name = "Nordzy-cursors";
	      size = 48;
	      package = pkgs.nordzy-cursor-theme;
	    };
	    iconTheme = {
	      name = "Nordzy-dark";
	      package = pkgs.nordzy-icon-theme;
	    };
	    indicators = [
	      "~host"
	      "~spacer"
	      "~session"
	      "~a11y"
	      "~clock"
	      "~power"
	    ];
	    theme = {
	      name = "Nordic";
	      package = pkgs.nordic;
	    };
	    extraConfig = '' font-name=Ubuntu,11 '';
          };
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
