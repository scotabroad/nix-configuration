{ config, inputs, pkgs, lib, ... }:

{
  programs.regreet = {
    settings = {
      background = {
        path = "${pkgs.custom-wallpapers}/Nordic.jpg";
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Nordzy-cursors";
        font_name = "Ubuntu Regular 11";
        icon_theme_name = "Nordzy-dark";
        theme_name = "Nordic";
      };
    };
    extraCss = ''
    frame {
      border-radius: 10px;
      padding: 6px;}
    '';
  };
}
