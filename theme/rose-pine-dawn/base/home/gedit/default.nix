{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "rose-pine-dawn-gedit";
    };
  };
  home.file.".local/share/gedit/styles/rosepinedawn.xml".source = ./rosepinedawn.xml;
}
