{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt6ct/colors/nord.conf".source = ./colors/nord.conf;
      ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    };
  };
}
