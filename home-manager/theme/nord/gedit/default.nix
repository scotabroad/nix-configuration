{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "nord-gedit";
    };
  };

  home = {
    packages = with pkgs; [
      nord-gedit
    ];
  };
}
