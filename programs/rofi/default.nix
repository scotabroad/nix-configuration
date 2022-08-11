{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./rofi.rasi;
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-power-menu
    ];
    extraConfig = {
      modi = "drun,window,calc,filebrowser,ssh,emoji,keys,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      dpi = 1;
    };
  };
}
