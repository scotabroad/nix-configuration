{ config, inputs, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home = {
    packages = with pkgs; [
      swaybg
    ];
  };
}
