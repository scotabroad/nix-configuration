{ config, inputs, pkgs, ... }:

{
  fonts = {
    fonts = [
      pkgs.terminus_font
      pkgs.nerdfonts
      pkgs.ubuntu_font_family
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
