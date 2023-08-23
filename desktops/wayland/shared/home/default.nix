{ config, inputs, pkgs, ... }:

{
  imports = [
    ./dconf
    ./programs
    ./services
  ];

  home = {
    packages = with pkgs; [
      grim
      networkmanagerapplet
      slurp
      swaylock
    ];
  };
}
