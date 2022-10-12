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
	        name = "Dracula-cursors";
		size = 48;
		package = pkgs.dracula-theme;
	      };
	      iconTheme = {
	        name = "Nordzy-dark";
		package = pkgs.nordzy-icon-theme;
	      };
	      theme = {
	        name = "Dracula";
		package = pkgs.dracula-theme;
	      };
	    };
	    slick = {
	      iconTheme = {
	        name = "Nordzy-dark";
		package = pkgs.nordzy-icon-theme;
	      };
	      theme = {
	        name = "Dracula";
		package = pkgs.dracula-theme;
	      };
	    };
	  };
	};
      };
    };
  };
}
