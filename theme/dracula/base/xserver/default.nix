{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/xserver
  ];
  
  services = {
    xserver = {
      displayManager = {
        lightdm = {
	  background = ../../../../wallpapers/dracula-base.png;
	  greeters = {
	    gtk = {
	      cursorTheme = {
	        name = "Dracula-cursors";
		size = 48;
		package = pkgs.dracula-theme;
	      };
	      iconTheme = {
	        name = "Zafiro-icons-Dark";
		package = pkgs.zafiro-icons;
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
