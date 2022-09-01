{ config, inputs, pkgs, ... }:

{
  services = {
    cinnamon = {
      apps.enable = true; # Some will eventually be turned off via the packages exclude option
    };

    xserver = {
      desktopManager = {
        cinnamon = {
	  enable = true;
	};
      };
    };
  };
}
