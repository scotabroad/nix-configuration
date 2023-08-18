{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/hyprland/home
    ../../../base/home
    ./dunst
    ./hyprpaper
    ./nwgbar
    ./nwggrid
    ./swaylock
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          #PARTY MODE!!!
          #col.active_border = rgba(eb6f92ff) rgba(ea9a97ff) rgba(f6c177ff) rgba(9ccfd8ff) rgba(3e8fb0ff) rgba(c4a7e7ff) 45deg
          col.active_border = rgba(c4a7e7ff) rgba(ea9a97ff) rgba(eb6f92ff) 45deg
          col.inactive_border = rgba(232136ff) rgba(2a273fff) rgba(2a283eff) rgba(393552ff) rgba(2a283eff) rgba(2a273fff) rgba(232136ff) 135deg
      }
      decoration {
          blur {
              enabled = true
              size = 3
              passes = 1
              new_optimizations = true
          }
      }
    '';
  };
}
