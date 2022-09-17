{ config, inputs, pkgs, lib, ... }:

{
  environment.pantheon.excludePackages = [
    pkgs.pantheon.epiphany
    pkgs.pantheon.elementary-camera
  ];

  programs = {
    pantheon-tweaks.enable = true;
  };

  services = {
    pantheon = {
      apps.enable = true; # Some will eventually be turned off via the packages exclude option
      contractor.enable = true; # Extensions service (am I adding bloat here? I don't care)
    };

    xserver = {
      displayManager = {
        defaultSession = "pantheon";
	lightdm = {
	  greeters.pantheon = {
	    enable = lib.mkForce false;
	  };
	};
      };

      desktopManager = {
        pantheon = {
	  enable = true;
	  extraWingpanelIndicators = [ 
	    pkgs.wingpanel-indicator-ayatana
	    pkgs.monitor
	  ];
	};
      };
    };
  };
}
