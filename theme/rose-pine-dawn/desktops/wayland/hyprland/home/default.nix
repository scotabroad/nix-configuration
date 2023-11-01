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
          #col.active_border = rgba(b4637aff) rgba(d7827eff) rgba(ea9d34ff) rgba(56949fff) rgba(286983ff) rgba(907aa9ff) 45deg
          #col.active_border = rgba(907aa9ff) rgba(d7827eff) rgba(b4637aff) 45deg
          #col.inactive_border = rgba(faf4edff) rgba(fffaf3ff) rgba(f4ede8ff) rgba(f2e9e1ff) rgba(f4ede8ff) rgba(fffaf3ff) rgba(faf4edff) 135deg
      }
      decoration {
          blur {
              enabled = false
          }
          drop_shadow = false
          dim_inactive = true
          dim_strength = 0.2
          rounding = 10
      }
      plugin {
          hyprbars {
              bar_color = rgba(f2e9e1bf) #Like Waybar, alpha=0.75, or bf in hex
              bar_text_font = Ubuntu Nerd Font #Like Waybar
              bar_text_size = 11
              bar_height = 26 #Like Waybar
              col.text = rgb(575279) #Like Waybar
              #Right to Left, like Arabic
              hyprbars-button = rgb(b4637a), 13, 󰖭, hyprctl dispatch killactive
          }
      }
    '';
  };
}
