{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/hyprland/home
    ../../../base/home
    ./dunst
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          col.active_border=0xff6272a4
          col.inactive_border=0xff282a36
      }
    '';
  };
}
