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
      ".config/gtk-4.0/gtk.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk.css";
      ".config/gtk-4.0/gtk-dark.css".source = "${pkgs.dracula-theme}/share/themes/Dracula/gtk-4.0/gtk-dark.css";
    };
    pointerCursor = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };
    };
    sessionVariables = {
      XCURSOR_THEME = "Dracula-cursors";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };

    cursorTheme = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Zafiro-icons-Dark";
      gtk-theme-name = "Dracula";
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
