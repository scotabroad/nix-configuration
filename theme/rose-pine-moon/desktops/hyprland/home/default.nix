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
          col.active_border=0xffc4a7e7
          col.inactive_border=0xff2a283e
      }
    '';
  };
}
