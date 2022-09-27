{ config, inputs, pkgs, lib, ... }:

{
  environment = {
    pantheon.excludePackages = with pkgs; [
      pantheon.epiphany
      pantheon.elementary-camera
      pantheon.elementary-code
      pantheon.elementary-tasks
    ];
    systemPackages = with pkgs; [
      indicator-application-gtk3 # Needed for wingpanel-indicator-ayatana
    ];
  };

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
