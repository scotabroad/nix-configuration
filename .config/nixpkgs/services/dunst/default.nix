{ config, inputs, pkgs, home-manager, ... }:

{
  # Manage dunst
  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "top-center";
      };
    };
  };
}
