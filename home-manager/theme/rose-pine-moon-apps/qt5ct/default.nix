{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/rosepinemoon.conf".source = ./colors/rosepinemoon.conf;
      ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    };
  };
}
