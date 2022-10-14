{ config, inputs, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/gedit/preferences/editor" = {
      scheme = "dracula";
    };
  };

  home = {
    packages = with pkgs; [
      dracula-gedit
    ];
  };
}
