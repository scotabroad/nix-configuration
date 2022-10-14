{ config, inputs, lib, pkgs, ... }:

{
  imports = [
    ../../../../../desktops/pantheon/system
    ../../../base/system
    ../../../base/xserver
  ];
}
