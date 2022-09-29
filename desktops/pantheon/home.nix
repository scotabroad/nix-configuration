{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs
    ./services
    ./dconf
  ];
}
