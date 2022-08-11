{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage picom
  services.picom = {
    enable = true;
    inactiveOpacity = "1.00";
    activeOpacity = "1.00";
    backend = "glx";
    experimentalBackends = false;
    shadow = false;
    extraOptions = ''
      corner-radius = 15
    '';
    vSync = true;
  };
}
