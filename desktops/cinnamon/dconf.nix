{ config, inputs, lib, home-manager, pkgs, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      background-color = "rgb(46,52,64)";
      font = "UbuntuMono Nerd Font Mono 12";
      foreground-color = "rgb(216,222,233)";
      highlight-colors-set = true;
      palette = [
        "rgb(59,66,82)"
	"rgb(191,97,106)"
	"rgb(163,190,140)"
	"rgb(235,203,139)"
	"rgb(129,161,193)"
	"rgb(180,142,173)"
        "rgb(136,192,208)"
	"rgb(229,233,240)"
	"rgb(76,86,106)"
	"rgb(191,97,106)"
	"rgb(163,190,140)"
	"rgb(235,203,139)"
	"rgb(129,161,193)"
	"rgb(180,142,173)"
	"rgb(143,188,187)"
	"rgb(236,239,244)"
      ];
      use-system-font = false;
      use-theme-colors = false;
    };
  };
}
