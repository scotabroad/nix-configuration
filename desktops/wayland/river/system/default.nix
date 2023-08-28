{ config, inputs, lib, pkgs, ... }:

{
  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      river-luatile
      swaybg
      waybar
    ];
    package = pkgs.river;
  };
}
