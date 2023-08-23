{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../desktops/wayland/system.nix
    ../../base/system
    ./hyprland/system
    #./river/system
    #./sway/system
    ./shared/system
  ];
}
