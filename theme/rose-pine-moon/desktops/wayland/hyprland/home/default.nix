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
          #col.active_border = rgba(eb6f92ff) rgba(ea9a97ff) rgba(f6c177ff) rgba(9ccfd8ff) rgba(3e8fb0ff) rgba(c4a7e7ff) 45deg
          #col.active_border = rgba(c4a7e7ff) rgba(ea9a97ff) rgba(eb6f92ff) 45deg
          #col.inactive_border = rgba(232136ff) rgba(2a273fff) rgba(2a283eff) rgba(393552ff) rgba(2a283eff) rgba(2a273fff) rgba(232136ff) 135deg
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
              bar_color = rgba(393552e6) #Like Waybar, alpha=0.9, or e6 in hex
              bar_text_font = Ubuntu Nerd Font #Like Waybar
              bar_text_size = 11
              bar_height = 26 #Like Waybar
              col.text = rgb(e0def4) #Like Waybar
              #Right to Left, like Arabic
              hyprbars-button = rgb(eb6f92), 13, 󰖭, hyprctl dispatch killactive
          }
      }
    '';
  };
}
