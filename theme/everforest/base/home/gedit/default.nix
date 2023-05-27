{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "everforest-hard";
    };
  };

  home = {
    packages = with pkgs; [
      everforest-gedit
    ];
  };
}
