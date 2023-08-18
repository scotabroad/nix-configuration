{ config, inputs, pkgs, lib, ... }:

let
  #Note: the usage of wlr-randr is specific to the 13" Framework laptop... fix to make more generic
  greetdCageScript = pkgs.writeScriptBin "greetd-cage-script" ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY WAYLAND_SOCK XDG_CURRENT_DESKTOP
    ${pkgs.wlr-randr}/bin/wlr-randr --output eDP-1 --mode 2256x1504@59.999001Hz --scale 2.000000
    ${config.programs.regreet.package}/bin/regreet
  '';
in {
  programs.regreet = {
    enable = true;
    package = pkgs.regreet-git;
  };
  
  services = {
    greetd = {
      #enable = true;
      settings.default_session.command =  "${lib.getExe pkgs.cage} -s -- sh -c ${greetdCageScript}/bin/greetd-cage-script";
    };
  };
}
