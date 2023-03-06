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
      color-scheme = "prefer-light";
    };
  };

  home = {
    file = {
    ".config/gtk-4.0/gtk.css".source = "${pkgs.rose-pine-gtk-theme}/share/themes/rose-pine-dawn-gtk/gtk-4.0/gtk.css";
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
      name = "rose-pine-dawn-gtk";
      package = pkgs.rose-pine-gtk-theme;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "rose-pine-dawn-icons";
      package = pkgs.rose-pine-icon-theme;
    };

    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "rose-pine-dawn-icons";
      gtk-theme-name = "rose-pine-dawn-gtk";
      gtk-application-prefer-dark-theme = 0;
    };
  };
}
