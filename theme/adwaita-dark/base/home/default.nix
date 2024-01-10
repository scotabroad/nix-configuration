{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./firefox
    ./neovim
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home = {
    pointerCursor = {
      name = "Adwaita";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };
    };
    sessionVariables = {
      XCURSOR_THEME = "Adwaita";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita";
      package = pkgs.gnome.gnome-themes-extra;
    };

    font = {
      name = "Cantarell Regular";
      size = 11;
      package = pkgs.cantarell-fonts;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Adwaita";
      gtk-theme-name = "Adwaita";
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
