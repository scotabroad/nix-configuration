{ config, inputs, pkgs, lib, ... }:

{
  services = {
    xserver = {
      displayManager = {
        lightdm = {
	  background = ../../wallpaper/Nordic.jpg;
	  greeters = {
	    gtk = {
	      cursorTheme = {
	        name = "Nordzy-cursors";
		size = 48;
		package = pkgs.nordzy-cursor-theme;
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
	    slick = {
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
      };
    };
  };
}
