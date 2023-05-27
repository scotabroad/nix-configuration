{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/wayland
  ];
  
  programs.regreet = {
    settings = {
      background = {
        path = "${pkgs.custom-wallpapers}/fog_forest_1.png";
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Yaru";
        font_name = "Ubuntu Regular 11";
        icon_theme_name = "Everforest-Dark";
        theme_name = "Everforest-Dark-BL";
      };
    };
    extraCss = ''
    frame {
      border-radius: 10px;
      padding: 6px;}
    '';
  };
}
