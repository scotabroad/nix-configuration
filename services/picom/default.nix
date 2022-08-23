{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage picom
  services.picom = {
    enable = true;
    inactiveOpacity = 1.0;
    activeOpacity = 1.0;
    backend = "glx";
    experimentalBackends = false;
    shadow = false;
    settings = {
      corner-radius = 15;
    };
    vSync = true;
  };
}
