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
          #col.active_border=rgba(b4637aff) rgba(d7827eff) rgba(ea9d34ff) rgba(56949fff) rgba(286983ff) rgba(907aa9ff) 45deg
          col.active_border=rgba(907aa9ff) rgba(d7827eff) rgba(b4637aff) 45deg
          col.inactive_border=rgba(faf4edff) rgba(fffaf3ff) rgba(f4ede8ff) rgba(f2e9e1ff) rgba(f4ede8ff) rgba(fffaf3ff) rgba(faf4edff) 135deg
      }
      decoration {
          blur=0
      }
    '';
  };
}
