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
          #col.active_border = rgba(eb6f92ff) rgba(ebbcbaff) rgba(f6c177ff) rgba(9ccfd8ff) rgba(31748fff) rgba(c4a7e7ff) 45deg
          #col.active_border = rgba(c4a7e7ff) rgba(ebbcbaff) rgba(eb6f92ff) 45deg
          #col.inactive_border = rgba(191724ff) rgba(1f1d2eff) rgba(21202eff) rgba(26233aff) rgba(21202eff) rgba(1f1d2eff) rgba(191724ff) 135deg
      }
      decoration {
          col.shadow = rgba(c4a7e7ee)
          col.shadow_inactive = rgba(191724ee)
          drop_shadow = true
          shadow_range = 6
          shadow_render_power = 2
          blur {
              enabled = true
              size = 3
              passes = 1
              new_optimizations = true
          }
          dim_inactive = true
          dim_strength = 0.2
          rounding = 10
      }
      plugin {
          hyprbars {
              bar_color = rgba(26233ae6) #Like Waybar, alpha=0.9, or e6 in hex
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
