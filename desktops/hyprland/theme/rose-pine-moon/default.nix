{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dunst
  ];

  wayland.windowManager.hyprland = {
    extraConfig = ''
      general {
          col.active_border=0xffc4a7e7
          col.inactive_border=0xff2a283e
      }
      bind=ALT,R,exec,fuzzel -b 232136e6 -t e0def4ff -B 2 -r 5 -C c4a7e7ff -s c4a7e7ff -S 232136ff -i rose-pine-moon-icons -f UbuntuMono --no-fuzzy
    '';
  };
}
