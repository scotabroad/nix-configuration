{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/gnome/home
    ../../../base/home
  ];

  dconf.settings = {
    "org/gnome/shell/extensions/user-theme".name = "Everforest-Dark-BL";
  };

  programs.gnome-terminal.profile = {
    "6df3d4ab-f391-4e2f-9917-e8dd0cfa4763" = {
      colors = {
        backgroundColor = "rgb(39,46,51)"; 
        boldColor = null; #same as foreground
        cursor = {
          background = "rgb(211,198,170)";
          foreground = "rgb(46,56,60)";
        };
        foregroundColor = "rgb(211,198,170)";
        highlight = {
          background = "rgb(76,55,67)";
          foreground = "rgb(157,169,160)";
        };
        palette = [
          "rgb(52,63,68)"
          "rgb(230,126,128)"
          "rgb(167,192,128)"
          "rgb(219,188,127)"
          "rgb(127,187,179)"
          "rgb(214,153,182)"
          "rgb(131,192,146)"
          "rgb(133,146,137)"
          "rgb(61,72,77)"
          "rgb(230,126,128)"
          "rgb(167,192,128)"
          "rgb(219,188,127)"
          "rgb(127,187,179)"
          "rgb(214,153,182)"
          "rgb(131,192,146)"
          "rgb(157,169,160)"
        ];
      };
      font = "UbuntuMono Nerd Font Mono 12";
      transparencyPercent = 10;
    };
  };
}
