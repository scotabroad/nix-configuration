{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs
    ./services
  ];

  home = {
    packages = with pkgs; [
      swaybg
    ];
  };
}
