{ config, inputs, pkgs, ... }:

{
  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" ];
  };
}
