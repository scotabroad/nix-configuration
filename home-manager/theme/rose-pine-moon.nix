{ config, inputs, pkgs, ... }:

{
  imports = [
    ./rose-pine-moon-apps
  ];

  gtk = {
    enable = true;

    theme = {
      name = "rose-pine-moon-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "rose-pine-moon-icons";
      package = pkgs.rose-pine-icon-theme;
    };

    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Nordzy-dark";
      gtk-theme-name = "Nordic";
      gtk-application-prefer-dark-theme = 0;
    };
  };
}
