{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ../../../../desktops/wayland/home.nix
    ../../base/home
    ./hyprland/home
    ./river/home
    #./sway/home
    ./shared/home
  ];
}
