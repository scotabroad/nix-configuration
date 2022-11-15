{ config, inputs, pkgs, ... }:

{
  imports = [
    ../../../../base/home
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
      ".config/fcitx/skin".source = pkgs.fetchFromGitHub {
        owner = "Yucklys";
        repo = "fcitx-nord-skin";
        rev = "4ae8525024be78d5fb9b9589bac7ff78ab9c4b34";
        sha256 = "K6qy09XqnotglMRdd4H2Na6D8QgikY11/PsZKb41dVI=";
      };
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
