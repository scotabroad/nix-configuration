{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/wayland
  ];
  
  programs.regreet = {
    settings = {
      background = {
        path = "${pkgs.custom-wallpapers}/winter-in-bohemia.png";
        fit = "Cover";
      };
      GTK = {
        cursor_theme_name = "Yaru";
        font_name = "Ubuntu Regular 11";
        icon_theme_name = "rose-pine-dawn-icons";
        theme_name = "rose-pine-dawn-gtk";
      };
    };
  };
}
