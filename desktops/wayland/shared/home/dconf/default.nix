{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "";
    };
  };
}
