{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/xserver
  ];

  services = {
    xserver = {
      displayManager = {
        lightdm = {
          background = "${pkgs.custom-wallpapers}/Nordic.jpg";
          greeters = {
            gtk = {
              cursorTheme = {
                name = "Nordzy-cursors";
                size = 48;
                package = pkgs.nordzy-cursor-theme;
              };
              iconTheme = {
                name = "Nordzy-dark";
                package = pkgs.nordzy-icon-theme;
              };
              theme = {
                name = "Nordic";
                package = pkgs.nordic;
              };
              extraConfig = '' font-name=Ubuntu,11 '';
            };
          };
        };
      };
    };
  };
}
