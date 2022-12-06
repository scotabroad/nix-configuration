{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "rose-pine-gedit";
    };
  };
  home.file.".local/share/gedit/styles/rosepine.xml".source = ./rosepine.xml;
}
