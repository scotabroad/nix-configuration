{ config, inputs, pkgs, ... }:

let
  rosepineRiver = pkgs.writeScriptBin "theme" ''
    ${pkgs.river}/bin/riverctl background-color 0x191724
    ${pkgs.river}/bin/riverctl border-color-focused 0xc4a7e7
    ${pkgs.river}/bin/riverctl border-color-unfocused 0x26233a
    ${pkgs.swaybg}/bin/swaybg -i ${pkgs.custom-wallpapers}/winter-in-bohemia_dark.jpg
  '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${rosepineRiver}/bin/theme";
}
