{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/hyprland/home
    ../../../base/home
    ./dunst
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          col.active_border=0xff6272a4
          col.inactive_border=0xff282a36
      }
      bind=ALT,R,exec,fuzzel -b 282a36e6 -t f8f8f2ff -B 2 -r 5 -C 6272a4ff -s 44475aff -S f8f8f2ff -i Zafiro-icons-Dark -f UbuntuMono:size=14
    '';
  };
}
