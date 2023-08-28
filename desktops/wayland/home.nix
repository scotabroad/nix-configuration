{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hyprland/home
    ./river/home
    #./sway/home
    ./shared/home
  ];
}
