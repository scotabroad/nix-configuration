{ config, inputs, pkgs, ... }:

let
   everforestRiver = pkgs.writeScriptBin "theme" ''
     ${pkgs.river}/bin/riverctl background-color 0x272e33
     ${pkgs.river}/bin/riverctl border-color-focused 0xa7c080
     ${pkgs.river}/bin/riverctl border-color-unfocused 0x3d484d
     ${pkgs.swaybg}/bin/swaybg -i ${pkgs.custom-wallpapers}/fog_forest_1.png
   '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${everforestRiver}/bin/theme";
}
