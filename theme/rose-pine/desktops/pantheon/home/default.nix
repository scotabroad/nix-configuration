{ config, inputs, lib, home-manager, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/pantheon/home
    ../../../base/home
  ];
  
  dconf.settings = {
    "io/elementary/terminal/settings" = {
      background = "rgba(25,23,36,0.9)";
      cursor-color = "rgb(110,106,134)";
      follow-system-style = false; # shouldn't this be true?
      foreground = "rgb(224,222,244)";
      palette = "rgb(38,35,58):rgb(235,111,146):rgb(49,116,143):rgb(246,193,119):rgb(156,207,216):rgb(196,167,231):rgb(235,188,186):rgb(224,222,244):rgb(101,106,134):rgb(235,111,146):rgb(49,116,143):rgb(246,193,119):rgb(156,207,216):rgb(196,167,231):rgb(235,188,186):rgb(224,222,244)";
      prefer-dark-style = true;
    };

    "org/gnome/desktop/interface" = {
    };

    "org/gnome/desktop/interface" = {
      # Color theme
      gtk-theme = "rose-pine-moon-gtk";
      icon-theme = "rose-pine-moon-icons";
      primary-color = "rgb(25,23,36)";
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
