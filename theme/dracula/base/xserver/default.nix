{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/xserver
  ];
  
  services = {
    xserver = {
      displayManager = {
        lightdm = {
	  background = ../../../../wallpapers/Nordic.jpg;
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
	      extraConfig = '' font-name=Ubuntu,11 '';
	    };
	  };
	};
      };
    };
  };
}
