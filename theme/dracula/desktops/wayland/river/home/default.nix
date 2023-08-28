{ config, inputs, pkgs, ... }:

let
   draculaRiver = pkgs.writeScriptBin "theme" ''
     ${pkgs.river}/bin/riverctl background-color 0x282a36
     ${pkgs.river}/bin/riverctl border-color-focused 0x6272a4
     ${pkgs.river}/bin/riverctl border-color-unfocused 0x414458
     ${pkgs.swaybg}/bin/swaybg -m fill -i ${pkgs.custom-wallpapers}/dracula-base.png
   '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${draculaRiver}/bin/theme";
}
