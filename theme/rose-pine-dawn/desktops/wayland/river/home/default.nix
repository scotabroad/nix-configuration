{ config, inputs, pkgs, ... }:

let
  rosepinedawnRiver = pkgs.writeScriptBin "theme" ''
    ${pkgs.river}/bin/riverctl background-color 0xfaf4ed
    ${pkgs.river}/bin/riverctl border-color-focused 0x907aa9
    ${pkgs.river}/bin/riverctl border-color-unfocused 0xf2e9e1
    ${pkgs.swaybg}/bin/swaybg -i ${pkgs.custom-wallpapers}/winter-in-bohemia.png
  '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${rosepinedawnRiver}/bin/theme";
}
