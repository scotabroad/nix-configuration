{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Nord theme
    colors = [
      "3b4252"
      "bf616a"
      "a3be8c"
      "ebcb8b"
      "81a1c1"
      "b48ead"
      "88c0d0"
      "e5e9f0"
      "4c566a"
      "bf616a"
      "a3be8c"
      "ebcb8b"
      "81a1c1"
      "b48ead"
      "8fbcbb"
      "eceff4"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment = {
    systemPackages = with pkgs; [
      nordic
      nordzy-cursor-theme
      nordzy-icon-theme
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
