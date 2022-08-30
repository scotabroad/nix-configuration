{ config, inputs, pkgs, ... }:

{
  imports = [
    ./emacs
    ./exa
    ./feh
    ./git
    ./kitty
    ./neovim
    ./rofi
    #./xmobar
    ./zsh
  ];
}
