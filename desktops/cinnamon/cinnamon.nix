{ config, inputs, pkgs, ... }:

{
  services = {
    cinnamon = {
      apps.enable = true; # Some will eventually be turned off via the packages exclude option
    };

    xserver = {
      displayManager = {
        defaultSession = "cinnamon";
	lightdm = {
	  greeters.slick = {
	    enable = true;
	    font = {
	      name = "Ubuntu 22";
	      package = pkgs.ubuntu_font_family;
	    };
	    iconTheme = {
	      name = "Nordzy-dark";
	      package = pkgs.nordzy-icon-theme;
	    };
	    theme = {
	      name = "Nordic";
	      package = pkgs.nordic;
	    };
	  };
	};
      };

      desktopManager = {
        cinnamon = {
	  enable = true;
	};
      };
    };
  };
}
