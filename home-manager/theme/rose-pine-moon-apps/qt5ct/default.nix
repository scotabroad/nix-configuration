{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/rosepinemoon.conf".source = ./colors/rosepinemoon.conf;
    };
  };
}
