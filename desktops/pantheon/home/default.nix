{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./files
    ./programs
    ./services
  ];
}
