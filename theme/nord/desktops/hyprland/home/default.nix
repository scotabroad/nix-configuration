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
          col.active_border=0xff8fbcbb
          col.inactive_border=0xff2e3440
      }
      bind=ALT,R,exec,fuzzel -b 2e3440e6 -t d8dee9ff -B 2 -r 20 -C 8fbcbbff -s 8fbcbbff -S 2e3440ff -i Nordzy-dark -f UbuntuMono:size=14
    '';
  };
}
