{config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../../../../base/system
  ];

  # tty console settings
  console = {
    # Enable Yaru theme
    colors = [
      "171421"
      "c01c28"
      "26a269"
      "a2734c"
      "12488b"
      "a347ba"
      "2aa1b3"
      "d0cfcc"
      "5e5c64"
      "f66151"
      "33d17a"
      "e9ad0c"
      "2a7bde"
      "c061cb"
      "33c7de"
      "ffffff"
    ];
    # Bigger tty font
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };

  environment = {
    systemPackages = with pkgs; [
      yaru-theme
    ];
    variables = {
      GTK_THEME = "Yaru";
      #QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct"; #can only be qt5ct or qt6ct, but NOT both. qt6ct can use either, but qt5ct needs qt5ct
    };
  };

  qt = {
    enable = true;
    platformTheme = lib.mkForce "gtk2";
    style = "gtk2";
  };

  fonts = {
    packages = with pkgs; [
      terminus_font
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      nerd-fonts.tinos
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
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
