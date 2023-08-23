{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    ./hyprland/system
    #./river/system
    #./sway/system
    ./shared/system
  ];
}
