{ config, inputs, pkgs, ... }:

{
  home = {
    file = {
      ".config/qt5ct/colors/rosepinedawn.conf".source = ./colors/rosepinedawn.conf;
      ".config/qt5ct/qt5ct.conf".source = ./qt5ct.conf;
    };
  };
}
