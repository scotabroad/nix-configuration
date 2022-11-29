{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
    ./fcitx5
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
      ".config/gtk-4.0/gtk.css".source = "${pkgs.nordic}/share/themes/Nordic/gtk-4.0/gtk.css";
      ".config/gtk-4.0/gtk-dark.css".source = "${pkgs.nordic}/share/themes/Nordic/gtk-4.0/gtk-dark.css";
    };
    pointerCursor = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
      gtk.enable = true;
      x11 = {
        enable = true;
        defaultCursor = "left_ptr";
      };
    };
    sessionVariables = {
      XCURSOR_THEME = "Nordzy-cursors";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    font = {
      name = "Ubuntu Regular";
      size = 11;
      package = pkgs.ubuntu_font_family;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };

    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Nordzy-dark";
      gtk-theme-name = "Nordic";
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
