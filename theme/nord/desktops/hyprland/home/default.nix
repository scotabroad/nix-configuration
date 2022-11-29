{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/hyprland/home
    ../../../base/home
    ./dunst
    ./hyprpaper
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          #PARTY MODE!!!
          #col.active_border=rgba(bf616aff) rgba(ebcb8bff) rgba(a3be8cff) rgba(88c0d0ff) rgba(81a1c1ff) rgba(b48eadff) 45deg
          col.active_border=rgba(8fbcbbff) rgba(88c0d0ff) rgba(81a1c1ff) rgba(5e81acff) 45deg
          col.inactive_border=rgba(2e3440ff) rgba(3b4252ff) rgba(434c5eff) rgba(4c566aff) rgba(434c5eff) rgba(3b4252ff) rgba(2e3440ff) 135deg
      }
    '';
  };
}
