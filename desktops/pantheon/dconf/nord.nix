{ config, inputs, lib, home-manager, pkgs, ... }:

{
  dconf.settings = {
    
    "io/elementary/terminal/settings" = {
      background = "rgba(46,52,64,0.9)";
      cursor-color = "rgb(129,161,193)";
      follow-system-style = false; # shouldn't this be true?
      foreground = "rgb(216,222,233)";
      palette = "rgb(59,66,82):rgb(191,97,106):rgb(163,190,140):rgb(235,203,139):rgb(129,161,193):rgb(180,142,173):rgb(136,192,208):rgb(229,233,240):rgb(76,86,106):rgb(191,97,106):rgb(163,190,140):rgb(235,203,139):rgb(129,161,193):rgb(180,142,173):rgb(143,188,187):rgb(236,239,244)";
      prefer-dark-style = true;
    };

    "org/gnome/desktop/interface" = {
      primary-color = "rgb(46,52,64)";
    };

    "org/gnome/desktop/interface" = {
      gtk-theme = "Nordic";
      icon-theme = "Nordzy-dark";
    };
  };
}