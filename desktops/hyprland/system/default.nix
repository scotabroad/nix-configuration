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
      #package = null;
    };
    
    # Enable backlight
    light = {
      enable = true;
    };
  };
  
  services = {
    # Enable sound
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };

    # For backlight
    udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
  };

  security = {
    pam.services.swaylock.text = "auth include login";
  };
}
