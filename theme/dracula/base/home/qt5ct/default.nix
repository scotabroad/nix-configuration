{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/Dracula.conf".source = ./colors/Dracula.conf;
      ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    };
  };
}
