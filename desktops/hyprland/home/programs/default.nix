{ config, inputs, pkgs, ... }:

{
  imports = [
    ./kitty
    ./nwgbar
    ./nwggrid
    ./obs-studio
    ./waybar
  ];
}
