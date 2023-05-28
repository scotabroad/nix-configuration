{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./fcitx5
    ./firefox
    ./gedit
    ./kitty
    ./neovim
    ./qt5ct
  ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home = {
    file = {
      ".config/gtk-4.0/gtk.css".source = "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/gtk.css";
      ".config/gtk-4.0/gtk-dark.css".source = "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/gtk-dark.css";
      ".config/gtk-4.0/assets".source = "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark-BL/gtk-4.0/assets";
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
      name = "Everforest-Dark-BL";
      package = pkgs.everforest-gtk-theme;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-icon-theme;
    };

    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Everforest-Dark";
      gtk-theme-name = "Everforest-Dark-BL";
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
