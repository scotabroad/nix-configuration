{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Dracula theme
    colors = [
      "282a36"
      "ff5555"
      "50fa7b"
      "f1fa8c"
      "bd93f9"
      "ff79c6"
      "8be9fd"
      "f8f8f2"
      "6272a4"
      "ff7777"
      "70fa9b"
      "ffb86c"
      "cfa9ff"
      "ff88e8"
      "97e2ff"
      "ffffff"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment.variables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
  };

  qt5 = {
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
