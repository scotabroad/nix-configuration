{ config, inputs, pkgs, lib, ... }:

{
  programs.regreet = {
    settings = {
      background = {
        path = "${pkgs.custom-wallpapers}/dracula-base.png";
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Dracula-cursors";
        font_name = "Ubuntu Regular 11";
        icon_theme_name = "Zafiro-icons-Dark";
        theme_name = "Dracula";
      };
    };
    extraCss = ''
    frame {
      border-radius: 10px;
      padding: 6px;}
    '';
  };
}
