{ config, inputs, pkgs, home-manager, ... }:

{
  #Manage status-notifier item
  services.status-notifier-watcher = {
    enable = true;
    package = pkgs.haskellPackages.status-notifier-item;
  };
}
