{ config, inputs, pkgs, ... }:

let
  riverInit = pkgs.writeScriptBin "init" (builtins.readFile ./init);
in{
  imports = [
    ./programs
    ./services
  ];

  home = {
    packages = with pkgs; [
      swaybg
      waybar
    ];
    file = {
      ".config/river-luatile/layout.lua".source = ./layout.lua;
      ".config/river/init".source = "${riverInit}/bin/init";
    };
  };
}
