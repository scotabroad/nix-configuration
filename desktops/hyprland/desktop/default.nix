{ config, inputs, pkgs, ... }:

{
  #Fixes for Qt5 XWayland
  imports = [
    ./octave.nix
    ./qt5ct.nix
  ];
}
