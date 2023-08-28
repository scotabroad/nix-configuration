{ config, inputs, pkgs, lib, ... }:

{
  programs.regreet = {
    settings = {
      background = {
        path = "${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg";
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Yaru";
        font_name = "Ubuntu Regular 11";
        icon_theme_name = "rose-pine-icons";
        theme_name = "rose-pine-gtk";
      };
    };
    extraCss = (builtins.readFile ./regreet.css);
  };
}