{ config, inputs, pkgs, ... }:

{
  imports = [
    ./hyprpaper
    ./nwgbar
    ./nwggrid
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          border_size = 0
          #PARTY MODE!!!
          #col.active_border = rgba(e67e80ff) rgba(dbbc7fff) rgba(a7c080ff) rgba(83c092ff) rgba(7fbbb3ff) rgba(d699b6ff) 45deg
          #col.active_border = rgba(a7c080ff) rgba(83c092ff) 45deg
          #col.inactive_border = rgba(272e33ff) rgba(343f44ff) rgba(3d484dff) rgba(343f44ff) rgba(272e33ff) 135deg
      }
      decoration {
          blur {
              enabled = true
              size = 3
              passes = 1
              new_optimizations = true
          }
          drop_shadow = false
          dim_inactive = true
          dim_strength = 0.2
          rounding = 10
      }
      plugin {
          hyprbars {
              bar_color = rgba(374145e6) #Like Waybar, alpha=0.9, or e6 in hex
              bar_text_font = Ubuntu Nerd Font #Like Waybar
              bar_text_size = 11
              bar_height = 26 #Like Waybar
              col.text = rgb(d3c6aa) #Like Waybar
              #Right to Left, like Arabic
              hyprbars-button = rgb(e67e80ff), 13, 󰖭, hyprctl dispatch killactive
          }
      }
    '';
  };
}
