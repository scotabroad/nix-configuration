{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      document-font-name = "Ubuntu 10";
      font-name = "Ubuntu Regular 11";
      gtk-theme = "Nordic";
      icon-theme = "Nordzy-dark";
      monospace-font-name = "UbuntuMono Nerd Font Mono 12";
    };
  };
}
