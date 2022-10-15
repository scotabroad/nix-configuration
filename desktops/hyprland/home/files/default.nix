{ config, inputs, pkgs, ... }:

{
  #Fixes for Qt5 XWayland
  imports = [
    ./fuzzel.nix
    ./octave.nix
    ./qt5ct.nix
  ];
}
