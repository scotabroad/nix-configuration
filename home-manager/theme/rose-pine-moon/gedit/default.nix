{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "classic";
    };
  };
}
