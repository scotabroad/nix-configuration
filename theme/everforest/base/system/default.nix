{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Everforest theme
    colors = [
      "343f44"
      "e67e80"
      "a7c080"
      "dbbc7f"
      "7fbbb3"
      "d699b6"
      "83c092"
      "859289"
      "3d484d"
      "e67e80"
      "a7c080"
      "dbbc7f"
      "7fbbb3"
      "d699b6"
      "83c092"
      "9da9a0"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment = {
    systemPackages = with pkgs; [
      everforest-gtk-theme
      everforest-icon-theme
      yaru-theme
    ];
    variables = {
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct"; #can only be qt5ct or qt6ct, but NOT both. qt6ct can use either, but qt5ct needs qt5ct 
    };
  };

  qt = {
    enable = true;
    platformTheme = lib.mkForce "qt5ct";
  };

  fonts = {
    fonts = with pkgs; [
      terminus_font
      nerdfonts
      ubuntu_font_family
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "Ubuntu Mono Nerd Font Complete Mono"
        ];
        sansSerif = [
          "Ubuntu Regular"
        ];
        serif = [
          "Ubuntu Regular"
        ];
      };
    };
  };
}
