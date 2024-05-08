{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./firefox
    ./neovim
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
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
      gtk-application-prefer-dark-theme = 0;
    };
  };
}
