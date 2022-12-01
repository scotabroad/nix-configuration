{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/hyprland/home
    ../../../base/home
    ./dunst
    ./hyprpaper
    ./nwgbar
    ./nwggrid
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          #PARTY MODE!!!
          #col.active_border=rgba(eb6f92ff) rgba(ebbcbaff) rgba(f6c177ff) rgba(9ccfd8ff) rgba(31748fff) rgba(c4a7e7ff) 45deg
          col.active_border=rgba(c4a7e7ff) rgba(ebbcbaff) rgba(eb6f92ff) 45deg
          col.inactive_border=rgba(191724ff) rgba(1f1d2eff) rgba(21202eff) rgba(26233aff) rgba(21202eff) rgba(1f1d2eff) rgba(191724ff) 135deg
      }
    '';
  };
}
