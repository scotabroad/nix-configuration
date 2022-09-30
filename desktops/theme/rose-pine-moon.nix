{ config, inputs, pkgs, lib, ... }:

{
  services = {
    xserver = {
      displayManager = {
        lightdm = {
	  background = ../../wallpaper/winter-in-bohemia.png;
	  greeters = {
	    gtk = {
	      cursorTheme = {
	        name = "Nordzy-cursors";
		size = 48;
		package = pkgs.nordzy-cursor-theme;
	      };
	      iconTheme = {
	        name = "rose-pine-moon-icons";
		package = pkgs.rose-pine-icon-theme;
	      };
	      theme = {
	        name = "rose-pine-moon-gtk";
		package = pkgs.rose-pine-gtk-theme;
	      };
	    };
	    slick = {
	      iconTheme = {
	        name = "rose-pine-moon-icons";
		package = pkgs.rose-pine-icon-theme;
	      };
	      theme = {
	        name = "rose-pine-moon-gtk";
		package = pkgs.rose-pine-gtk-theme;
	      };
	    };
	  };
	};
      };
    };
  };
}
