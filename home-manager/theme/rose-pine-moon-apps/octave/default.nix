{ config, inputs, pkgs, ... }:

{
  home.file = {
    ".config/octave/octave-gui.ini".source = ./octave-gui.ini;
  };
}
