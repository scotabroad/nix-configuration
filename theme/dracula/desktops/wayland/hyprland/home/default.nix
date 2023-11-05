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
          #col.active_border = rgba(ff5555ff) rgba(ffaf5fff) rgba(ffff87ff) rgba(50fa7bff) rgba(88e9fdff) rgba(5f5fafff) rgba(ff79c6ff) 45deg
          #col.active_border = rgba(6272a4ff) rgba(5f5fafff) 45deg
          #col.inactive_border = rgba(282a36ff) rgba(2b2e3bff) rgba(363949ff) rgba(414458ff) rgba(363949ff) rgba(2b2e3bff) rgba(282a36ff) 135deg
      }
      decoration {
          col.shadow = rgba(6272a4ee)
          col.shadow_inactive = rgba(282a36ee)
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
              bar_color = rgba(282a36e6) #Like Waybar, alpha=0.9, or e6 in hex
              bar_text_font = Ubuntu Nerd Font #Like Waybar
              bar_text_size = 11
              bar_height = 26 #Like Waybar
              col.text = rgb(f8f8f2) #Like Waybar
              #Right to Left, like Arabic
              hyprbars-button = rgb(ff5555), 13, 󰖭, hyprctl dispatch killactive
          }
      }
    '';
  };
}
