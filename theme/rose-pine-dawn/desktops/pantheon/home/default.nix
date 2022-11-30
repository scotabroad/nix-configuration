{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/pantheon/home
    ../../../base/home
  ];
  
  dconf.settings = {
    "io/elementary/terminal/settings" = {
      background = "rgba(250,244,237,0.9)";
      cursor-color = "rgb(152,147,165)";
      follow-system-style = false; # shouldn't this be true?
      foreground = "rgb(87,82,121)";
      palette = "rgb(242,233,222):rgb(180,99,122):rgb(40,105,131):rgb(234,157,52):rgb(86,148,159):rgb(144,122,169):rgb(215,130,126):rgb(87,82,121):rgb(101,106,134):rgb(180,99,122):rgb(40,105,131):rgb(234,157,52):rgb(86,148,159):rgb(144,122,169):rgb(215,130,126):rgb(87,82,121)";
      prefer-dark-style = true;
    };

    "org/gnome/desktop/interface" = {
    };

    "org/gnome/desktop/interface" = {
      # Color theme
      gtk-theme = "rose-pine-dawn-gtk";
      icon-theme = "rose-pine-dawn-icons";
      primary-color = "rgb(250,244,237)";
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
