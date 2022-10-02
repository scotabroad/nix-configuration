{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ./nord.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      document-font-name = "Ubuntu 10";
      font-name = "Ubuntu Regular 11";
      monospace-font-name = "UbuntuMono Nerd Font Mono 12";
    };
  };
}
