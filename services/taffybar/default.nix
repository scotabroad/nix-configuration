{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage picom
  services.taffybar = {
    enable = true;
    package = pkgs.haskellPackages.taffybar;
  };
}
