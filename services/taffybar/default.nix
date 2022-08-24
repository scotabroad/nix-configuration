{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage taffybar
  services.taffybar = {
    enable = true;
    package = pkgs.haskellPackages.my-taffybar;
  };
}
