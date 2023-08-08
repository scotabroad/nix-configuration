{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Nord theme
    colors = [
      "393552"
      "eb6f92"
      "3e8fb0"
      "f6c177"
      "9ccfd8"
      "c4a7e7"
      "ea9a97"
      "e0def4"
      "6e6a86"
      "eb6f92"
      "3e8fb0"
      "f6c177"
      "9ccfd8"
      "c4a7e7"
      "ea9a97"
      "e0def4"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment = {
    systemPackages = with pkgs; [
        rose-pine-gtk-theme
        rose-pine-icon-theme
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
    packages = with pkgs; [
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
