{ config, pkgs, inputs, lib, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
  };

  qt5 = {
    enable = true;
    platformTheme = lib.mkForce "qt5ct";
  };
}
