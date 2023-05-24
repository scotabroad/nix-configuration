{ config, inputs, pkgs, lib, ... }:

let
  greetdSwayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"
    input "type:touchpad" {
      tap enabled
    }

    xwayland disable

    bindsym XF86MonBrightnessUp exec light -A 5
    bindsym XF86MonBrightnessDown exec light -U 5
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'

    exec "${config.programs.regreet.package}/bin/regreet; swaymsg exit"
  '';
in {
  programs.regreet = {
    enable = true;
    package = pkgs.regreet-git;
  };
  
  services = {
    greetd = {
      #enable = true;
      #settings.default_session.command =  "${config.programs.sway.package}/bin/sway --config ${greetdSwayConfig}"; #Should only if sway is in defined via programs.sway.enable = true
      settings.default_session.command =  "${lib.getExe pkgs.sway} --config ${greetdSwayConfig}";
    };
  };
}
