{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.gnome.eog.desktop".source = ./org.gnome.eog.desktop;
}
