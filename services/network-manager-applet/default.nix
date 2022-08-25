{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage network manager
  services.network-manager-applet = {
    enable = true;
  };
}
