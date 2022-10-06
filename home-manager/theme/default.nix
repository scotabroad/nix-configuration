{ config, inputs, pkgs, ... }:

{
  imports = [
    #./nordic.nix
    ./rose-pine-moon.nix
  ];
}
