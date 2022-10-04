{ config, inputs, pkgs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
    };
    
    # Enable backlight
    light = {
      enable = true;
    };
  };
  services = {
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
  };
}
