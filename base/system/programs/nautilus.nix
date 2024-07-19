{ config, inputs, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      nautilus
    ];
  };
  services = {
    #For Trash in Nautilus
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
  };
}
