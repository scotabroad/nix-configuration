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
          #col.active_border=rgba(ff5555ff) rgba(ffaf5fff) rgba(ffff87ff) rgba(50fa7bff) rgba(88e9fdff) rgba(5f5fafff) rgba(ff79c6ff) 45deg
          col.active_border=rgba(6272a4ff) rgba(5f5fafff) 45deg
          col.inactive_border=rgba(282a36ff) rgba(2b2e3bff) rgba(363949ff) rgba(414458ff) rgba(363949ff) rgba(2b2e3bff) rgba(282a36ff) 135deg
      }
      decoration {
          blur=1
          blur_size=3
          blur_passes=1
          blur_new_optimizations=1
      }
    '';
  };
}
