{ config, inputs, pkgs, ... }:

{
  imports = [
    ./gedit
    ./kitty
    ./neovim
    ./qt5ct
  ];
}
