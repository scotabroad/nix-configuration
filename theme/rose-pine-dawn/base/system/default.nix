{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Nord theme
    colors = [
      "f2e9e1"
      "b4637a"
      "286983"
      "ea9d34"
      "56949f"
      "907aa9"
      "d7827e"
      "575279"
      "9893a5"
      "b4637a"
      "286983"
      "ea9d34"
      "56949f"
      "907aa9"
      "d7827e"
      "575279"
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
