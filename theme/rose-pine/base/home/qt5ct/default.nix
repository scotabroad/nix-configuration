{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/rosepine.conf".source = ./colors/rosepine.conf;
      ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    };
  };
}
