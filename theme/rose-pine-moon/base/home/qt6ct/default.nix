{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt6ct/colors/rosepinemoon.conf".source = ./colors/rosepinemoon.conf;
      ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    };
  };
}
