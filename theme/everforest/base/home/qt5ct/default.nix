{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/everforest.conf".source = ./colors/everforest.conf;
      ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    };
  };
}
