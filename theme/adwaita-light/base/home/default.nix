{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./firefox
    ./neovim
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
      color-scheme = "prefer-light";
    };
  };

  home = {
    pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
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
    #Dec 24 16:18:46 nixos .gnome-control-[2944]: Theme parser error: gtk.css:5:1-128: Failed to import:
    #Error opening file /nix/store/977qanna2p21y0ky2q3q4scbh2i3xj4c-gnome-themes-extra-3.28/share/themes/Adwaita/gtk-4.0/gtk.css:
    #No such file or directory
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    font = {
      name = "Cantarell Regular";
      size = 11;
      package = pkgs.cantarell-fonts;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Adwaita";
      gtk-theme-name = "Adwaita";
      #Using GtkSettings:gtk-application-prefer-dark-theme together with HdyStyleManager is unsupported.
      #Please use HdyStyleManager:color-scheme instead.
      #Using GtkSettings:gtk-application-prefer-dark-theme with libadwaita is unsupported.
      #Please use AdwStyleManager:color-scheme instead.
      #gtk-application-prefer-dark-theme = 0;
    };
  };
}
