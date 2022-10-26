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
          col.active_border=0xff8fbcbb
          col.inactive_border=0xff2e3440
      }
    '';
  };
}
