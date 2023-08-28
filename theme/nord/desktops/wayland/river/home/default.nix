{ config, inputs, pkgs, ... }:

let
   nordRiver = pkgs.writeScriptBin "theme" ''
     ${pkgs.river}/bin/riverctl background-color 0x2e3440
     ${pkgs.river}/bin/riverctl border-color-focused 0x8fbcbb
     ${pkgs.river}/bin/riverctl border-color-unfocused 0x4c566a
     ${pkgs.swaybg}/bin/swaybg -i ${pkgs.custom-wallpapers}/Nordic.jpg
   '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${nordRiver}/bin/theme";
}
