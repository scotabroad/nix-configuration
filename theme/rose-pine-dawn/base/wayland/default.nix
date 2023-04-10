{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/wayland
  ];

  services = {
    xserver = {
      displayManager = {
        sddm = {
          theme = ""; #default
        };
      };
    };
  };
}
