{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/nord.conf".source = ./colors/nord.conf;
    };
  };
}
