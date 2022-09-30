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
    ./theme
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
	  greeters = {
	    gtk = {
	      enable = true;
	      clock-format = "%l:%m %p";
	      indicators = [
	        "~host"
	        "~spacer"
	        "~session"
	        "~a11y"
	        "~clock"
	        "~power"
	      ];
	      extraConfig = '' font-name=Ubuntu,11 '';
	    };
	    slick = {
	      enable = false;
	      font = {
	        name = "Ubuntu 22";
		package = pkgs.ubuntu_font_family;
	      };
	    };
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
