{ config, inputs, pkgs, lib, ... }:

{
  services = {
    xserver = {
      displayManager = {
        lightdm = {
          background = "${pkgs.custom-wallpapers}/fog_forest_1.png";
          greeters = {
            gtk = {
              cursorTheme = {
                name = "Yaru";
                size = 48;
                package = pkgs.yaru-theme;
              };
              iconTheme = {
                name = "Everforest-Dark";
                package = pkgs.everforest-icon-theme;
              };
              theme = {
                name = "Everforest-Dark-BL";
                package = pkgs.everforest-gtk-theme;
              };
              extraConfig = '' font-name=Ubuntu,11 '';
            };
          };
        };
      };
    };
  };
}
