{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "rose-pine-moon-gedit";
    };
  };
  home.file.".local/share/gedit/styles/rosepinemoon.xml".source = ./rosepinemoon.xml;
}
