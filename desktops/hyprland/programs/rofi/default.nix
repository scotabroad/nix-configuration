{ config, inputs, pkgs, home-manager, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-power-menu
    ];
    extraConfig = {
      modi = "drun,calc,filebrowser,ssh,emoji,keys,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      dpi = 1;
    };
  };
}
