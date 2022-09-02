{ config, inputs, pkgs, ... }:

{
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
	    enable = true;
	  };
	};
      };

      desktopManager = {
        pantheon = {
	  enable = true;
	};
      };
    };
  };
}
