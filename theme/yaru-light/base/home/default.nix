{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./firefox
    ./neovim
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "orange";
      color-scheme = "prefer-light";
    };
  };

  home = {
    file = {
      ".config/gtk-4.0/gtk-dark.css".source = "${pkgs.yaru-theme}/share/themes/Yaru/gtk-4.0/gtk-dark.css";
      ".config/gtk-4.0/assets".source = "${pkgs.yaru-theme}/share/themes/Yaru/gnome-shell";
      ".config/assets".source = "${pkgs.yaru-theme}/share/themes/Yaru/gnome-shell";
    };
    pointerCursor = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };
    };
    sessionVariables = {
      XCURSOR_THEME = "Yaru";
    };
  };

  gtk = {
    enable = true;

    theme = {
    #Dec 24 16:18:46 nixos .gnome-control-[2944]: Theme parser error: gtk.css:5:1-128: Failed to import:
    #Error opening file /nix/store/977qanna2p21y0ky2q3q4scbh2i3xj4c-gnome-themes-extra-3.28/share/themes/Adwaita/gtk-4.0/gtk.css:
    #No such file or directory
      name = "Yaru";
      package = pkgs.yaru-theme;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
    };

    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Yaru";
      gtk-theme-name = "Yaru";
      #Using GtkSettings:gtk-application-prefer-dark-theme together with HdyStyleManager is unsupported.
      #Please use HdyStyleManager:color-scheme instead.
      #Using GtkSettings:gtk-application-prefer-dark-theme with libadwaita is unsupported.
      #Please use AdwStyleManager:color-scheme instead.
      #gtk-application-prefer-dark-theme = 0;
    };
  };
}
