{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt6ct/colors/Dracula.conf".source = ./colors/Dracula.conf;
      ".config/qt6ct/qt6ct.conf".source = ./qt6ct.conf;
    };
  };
}
