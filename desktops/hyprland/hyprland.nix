{ config, inputs, lib, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      htop
    ];
    variables = {
      GDK_SCALE = "2";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      XCURSOR_SIZE = lib.mkForce "48"; #needed for GTK XWayland apps
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = null;
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
