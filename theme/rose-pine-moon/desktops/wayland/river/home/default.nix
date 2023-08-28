{ config, inputs, pkgs, ... }:

let
  rosepinemoonRiver = pkgs.writeScriptBin "theme" ''
    ${pkgs.river}/bin/riverctl background-color 0x232136
    ${pkgs.river}/bin/riverctl border-color-focused 0xc4a7e7
    ${pkgs.river}/bin/riverctl border-color-unfocused 0x393552
    ${pkgs.swaybg}/bin/swaybg -i ${pkgs.custom-wallpapers}/winter-in-bohemia.png
  '';
in {
  imports = [
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
  home.file.".config/river/theme".source = "${rosepinemoonRiver}/bin/theme";
}
