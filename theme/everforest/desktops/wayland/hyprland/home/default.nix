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
          #PARTY MODE!!!
          #col.active_border = rgba(e67e80ff) rgba(dbbc7fff) rgba(a7c080ff) rgba(83c092ff) rgba(7fbbb3ff) rgba(d699b6ff) 45deg
          col.active_border = rgba(a7c080ff) rgba(83c092ff) 45deg
          col.inactive_border = rgba(272e33ff) rgba(343f44ff) rgba(3d484dff) rgba(343f44ff) rgba(272e33ff) 135deg
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
