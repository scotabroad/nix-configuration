{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/pantheon/home
    ../../../base/home
  ];

  dconf.settings = {
    "io/elementary/terminal/settings" = {
      background = "rgba(40,42,54,0.9)";
      cursor-color = "rgb(248,248,242)";
      follow-system-style = false;
      foreground = "rgb(248,248,242)";
      palette = "rgb(33,34,44):rgb(255,85,85):rgb(80,250,123):rgb(241,250,140):rgb(189,147,249):rgb(255,121,198):rgb(139,233,253):rgb(248,248,242):rgb(98,114,164):rgb(255,110,110):rgb(105,255,148):rgb(255,255,165):rgb(214,172,255):rgb(255,146,223):rgb(164,255,255):rgb(255,255,255)";
      prefer-dark-style = true;
    };

    "org/gnome/desktop/interface" = {
      # Color theme
      gtk-theme = "Dracula";
      icon-theme = "Zafiro-icons-Dark";
      primary-color = "rgb(40,42,54)";
      # Font theme
      document-font-name = "Ubuntu 10";
      font-name = "Ubuntu Regular 11";
      monospace-font-name = "UbuntuMono Nerd Font Mono 12";
    };

    "org/gnome/desktop/wm/preferences" = {
      titlebar-font = "Ubuntu 11";
    };
  };
}
