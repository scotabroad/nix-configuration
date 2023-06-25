{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt6ct/colors/rosepine.conf".source = ./colors/rosepine.conf;
      ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    };
  };
}
