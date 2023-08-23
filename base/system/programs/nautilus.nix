{ config, inputs, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gnome.nautilus
    ];
  };
  services = {
    #For Trash in Nautilus
    gvfs = {
      enable = true;
      package = pkgs.gnome.gvfs;
    };
  };
}
