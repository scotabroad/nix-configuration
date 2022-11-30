{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../base/xserver
  ];

  services = {
    xserver = {
      displayManager = {
        lightdm = {
          background = "${pkgs.custom-wallpapers}/winter-in-bohemia.png";
          greeters = {
            gtk = {
              cursorTheme = {
                name = "Nordzy-cursors";
                size = 48;
                package = pkgs.nordzy-cursor-theme;
              };
              iconTheme = {
                name = "rose-pine-dawn-icons";
                package = pkgs.rose-pine-icon-theme;
              };
              theme = {
                name = "rose-pine-dawn-gtk";
                package = pkgs.rose-pine-gtk-theme;
              };
              extraConfig = '' font-name=Ubuntu,11 '';
            };
          };
        };
      };
    };
  };
}
