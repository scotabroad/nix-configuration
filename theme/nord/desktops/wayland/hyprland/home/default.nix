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
          #col.active_border = rgba(bf616aff) rgba(ebcb8bff) rgba(a3be8cff) rgba(88c0d0ff) rgba(81a1c1ff) rgba(b48eadff) 45deg
          #col.active_border = rgba(8fbcbbff) rgba(88c0d0ff) rgba(81a1c1ff) rgba(5e81acff) 45deg
          #col.inactive_border = rgba(2e3440ff) rgba(3b4252ff) rgba(434c5eff) rgba(4c566aff) rgba(434c5eff) rgba(3b4252ff) rgba(2e3440ff) 135deg
      }
      decoration {
          col.shadow = rgba(8fbcbbee)
          col.shadow_inactive = rgba(2e3440ee)
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
              bar_color = rgba(3b4252e6) #Like Waybar, alpha=0.9, or e6 in hex
              bar_text_font = Ubuntu Nerd Font #Like Waybar
              bar_text_size = 11
              bar_height = 26 #Like Waybar
              col.text = rgb(d8dee9) #Like Waybar
              #Right to Left, like Arabic
              hyprbars-button = rgb(bf616a), 13, 󰖭, hyprctl dispatch killactive
          }
      }
    '';
  };
}
