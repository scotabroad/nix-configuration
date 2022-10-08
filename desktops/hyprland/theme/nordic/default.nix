{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dunst
    ./rofi
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          col.active_border=0xff8fbcbb
          col.inactive_border=0xff2e3440
      }
    '';
  };
}
