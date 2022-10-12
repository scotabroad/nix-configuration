{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./fonts.nix
    ./dracula.nix
    #./nord.nix
    #./rose-pine-moon.nix
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
  };

  qt5 = {
    enable = true;
    platformTheme = lib.mkForce "qt5ct";
  };
}
