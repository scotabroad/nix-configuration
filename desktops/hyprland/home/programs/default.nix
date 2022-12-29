{ config, inputs, pkgs, ... }:

{
  imports = [
    ./kitty
    ./nwgbar
    ./nwggrid
    ./waybar
  ];
}
