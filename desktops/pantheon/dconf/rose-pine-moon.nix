{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    
    "io/elementary/terminal/settings" = {
      background = "rgba(35,33,54,0.9)";
      cursor-color = "rgb(110,106,134)";
      follow-system-style = false; # shouldn't this be true?
      foreground = "rgb(224,222,244)";
      palette = "rgb(57,53,82):rgb(235,111,146):rgb(62,143,176):rgb(246,193,119):rgb(156,207,216):rgb(196,167,231):rgb(234,154,151):rgb(224,222,244):rgb(101,106,134):rgb(235,111,146):rgb(62,143,176):rgb(246,193,119):rgb(156,207,216):rgb(196,167,231):rgb(234,154,151):rgb(224,222,244)";
      prefer-dark-style = true;
    };

    "org/gnome/desktop/interface" = {
      primary-color = "rgb(46,52,64)";
    };

    "org/gnome/desktop/interface" = {
      #gtk-theme = "Nordic";
      #icon-theme = "Nordzy-dark";
    };
  };
}
