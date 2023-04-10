{ config, inputs, pkgs, lib, ... }:

{
  services = {
    xserver = {
      #defaultSession = "hyprland"; #keep uncommented for now
      displayManager = {
        sddm = {
          settings = {
            Wayland = {
              #CompositorCommand = "Hyprland";
            };
          };
        };
      };
    };
  };
}
