{ config, inputs, pkgs, lib, ... }:

let
  # dpi adjustment calculations
  monitorHeight = 2256;
  monitorWidth = 1504;
  monitorHeightInches = 11.25; # 285 mm
  monitorWidthInches = 7.5; # 190.5 mm
  newDPI = builtins.ceil ((monitorHeight / monitorHeightInches) + (monitorWidth / monitorWidthInches)) / 2; # Looking at a DPI of 201
in {
  services = {
    xserver = {
      enable = true;
      # Uncomment below to disable X server on boot
      # autorun = false; # Must run systemctl start display display-manager.service
      # Video Drivers can be specified here
      # videoDrivers = [ "r128" ]; this is for xf86-video-r128, might need this for xorg-x11-dev-intel
      dpi = newDPI;
      displayManager = {
        sddm = {
          enable = true;
          enableHidpi = true;
          #package = pkgs.libsForQt5.sddm;
          package = pkgs.sddm-git;
          settings = {
            #General = {
            #  DisplayServer = "wayland";
            #  GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
            #};
          };
        };
      };
      # Configure keymap in X11
      layout = "us";
    };
  };
}
