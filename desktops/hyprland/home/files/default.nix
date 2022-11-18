{ config, inputs, pkgs, ... }:

{
  #Fixes for Qt5 XWayland
  imports = [
    ./fcitx5-configtool.nix
    ./octave.nix
    ./org.fcitx.fcitx5-config-qt.nix        
    ./org.fcitx.fcitx5-migrator.nix         
    #./org.fcitx.fcitx5-qt5-gui-wrapper.nix
    ./org.fcitx.Fcitx5.nix
    ./qt5ct.nix
  ];
}
