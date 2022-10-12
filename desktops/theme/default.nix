{ config, inputs, pkgs, lib, ... }:

{
  imports = [
    #./nordic.nix
    ./rose-pine-moon.nix
  ];
}
