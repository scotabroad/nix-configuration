{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Nord theme
    colors = [
      "1d1d1d"
      "ed333b"
      "57e389"
      "ff7800"
      "62a0ea"
      "9141ac"
      "5bc8af"
      "deddda"
      "9a9996"
      "f66151"
      "8ff0a4"
      "ffa348"
      "99c1f1"
      "dc8add"
      "93ddc2"
      "f6f5f4"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment = {
    systemPackages = with pkgs; [
      gnome.gnome-themes-extra
      gnome.adwaita-icon-theme
    ];
    variables = {
      #QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct"; #can only be qt5ct or qt6ct, but NOT both. qt6ct can use either, but qt5ct needs qt5ct
    };
  };

  qt = {
    enable = true;
    platformTheme = lib.mkForce "gnome";
    style = "adwaita-dark";
  };

  fonts = {
    packages = with pkgs; [
      terminus_font
      nerdfonts
      cantarell-fonts
      ubuntu_font_family
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "SauceCodePro Nerd Font Mono"
        ];
        sansSerif = [
          "Cantarell Regular"
        ];
        serif = [
          "Cantarell Regular"
        ];
      };
    };
  };
}
