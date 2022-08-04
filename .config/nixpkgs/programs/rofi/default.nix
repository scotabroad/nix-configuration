{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./rofi.rasi;
    extraConfig = {
      modi = "drun,window,ssh,filebrowser";
      dpi = 1;
    };
  };
}
