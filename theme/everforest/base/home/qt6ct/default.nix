{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt6ct/colors/everforest.conf".source = ./colors/everforest.conf;
      ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    };
  };
}
